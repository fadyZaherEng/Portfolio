import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/resources/image_paths.dart';

class PaginationWidget extends StatefulWidget {
  final Function(List<Compounds> displayList) onPageChange;
  final int itemsPerPage;
  final List<Compounds> projectsList;

  const PaginationWidget({
    super.key,
    required this.onPageChange,
    required this.itemsPerPage,
    required this.projectsList,
  });

  @override
  State<PaginationWidget> createState() => _PaginationWidgetState();
}

class _PaginationWidgetState extends State<PaginationWidget> {
  int _totalPages = 0;
  int _currentPageNumber = 0;
  int _startPage = 0;
  int _endPage = 0;
  List<Compounds> _displayedList = [];

  @override
  void initState() {
    super.initState();
    _totalPages = (widget.projectsList.length / widget.itemsPerPage).ceil();
  }

  @override
  Widget build(BuildContext context) {
    _startPage =
        _currentPageNumber - (_currentPageNumber % widget.itemsPerPage);
    _endPage = _startPage + widget.itemsPerPage;
    if (_endPage > _totalPages) {
      _endPage = _totalPages;
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            if (_currentPageNumber > 0) {
              _currentPageNumber--;
              int startPage = _currentPageNumber * widget.itemsPerPage;
              int endPage = startPage + widget.itemsPerPage;
              if (endPage > widget.projectsList.length) {
                endPage = widget.projectsList.length;
              }
              setState(() {
                _displayedList =
                    widget.projectsList.getRange(startPage, endPage).toList();
                // TODO: implement update displayed list
                widget.onPageChange(_displayedList);
              });
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: ColorSchemes.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 2),
                    spreadRadius: 1,
                    blurRadius: 8,
                    color: Color.fromRGBO(0, 0, 0, 0.12),
                  ),
                ],
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                ImagePaths.icWebArrowRight,
                width: 16,
                height: 16,
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                  (_currentPageNumber == 0)
                      ? ColorSchemes.gray
                      : ColorSchemes.primary,
                  BlendMode.srcIn,
                ),
                matchTextDirection: true,
              ),
            ),
          ),
        ),
        Visibility(
          visible: _totalPages > 3 &&
              _currentPageNumber != 0 &&
              _currentPageNumber != 1 &&
              _currentPageNumber != 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Text(
              "...",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: ColorSchemes.gray,
                  ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_endPage - _startPage, (index) {
            int pageIndex = _startPage + index;
            return Padding(
              padding: const EdgeInsets.all(4),
              child: InkWell(
                onTap: () {
                  _currentPageNumber = pageIndex;
                  int startPage = _currentPageNumber * widget.itemsPerPage;
                  int endPage = startPage + widget.itemsPerPage;
                  if (endPage > widget.projectsList.length) {
                    endPage = widget.projectsList.length;
                  }
                  setState(() {
                    _displayedList = widget.projectsList
                        .getRange(startPage, endPage)
                        .toList();
                    // TODO: implement update displayed list
                    widget.onPageChange(_displayedList);
                  });
                },
                child: Text(
                  '${pageIndex + 1}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: _currentPageNumber == pageIndex
                            ? ColorSchemes.primary
                            : ColorSchemes.gray,
                      ),
                ),
              ),
            );
          }),
        ),
        Visibility(
          visible: _currentPageNumber != _totalPages - 1 && _totalPages > 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Text(
              "...",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: ColorSchemes.gray,
                  ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            if (_currentPageNumber < _totalPages - 1) {
              _currentPageNumber++;
              int startPage = _currentPageNumber * widget.itemsPerPage;
              int endPage = startPage + widget.itemsPerPage;
              if (endPage > widget.projectsList.length) {
                endPage = widget.projectsList.length;
              }
              setState(() {
                _displayedList =
                    widget.projectsList.getRange(startPage, endPage).toList();
                // TODO: implement update displayed list
                widget.onPageChange(_displayedList);
              });
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: ColorSchemes.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 1),
                    spreadRadius: 1,
                    blurRadius: 8,
                    color: Color.fromRGBO(0, 0, 0, 0.12),
                  ),
                ],
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                ImagePaths.icWebArrowLeft,
                width: 16,
                height: 16,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  (_currentPageNumber == _totalPages - 1)
                      ? ColorSchemes.gray
                      : ColorSchemes.primary,
                  BlendMode.srcIn,
                ),
                matchTextDirection: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Compounds {}

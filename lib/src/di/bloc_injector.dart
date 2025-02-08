import 'package:my_portfolio/src/di/data_layer_injector.dart';
import 'package:my_portfolio/src/presentation/blocs/main/main_bloc.dart';
import 'package:my_portfolio/src/presentation/blocs/portfolio/portfolio_bloc.dart';

Future<void> initializeBlocDependencies() async {
  injector.registerFactory<MainCubit>(() => MainCubit(
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<PortfolioBloc>(() => PortfolioBloc(
        injector(),
        injector(),
        injector(),
        injector(),
      ));
}

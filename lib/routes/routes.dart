import '../presentation/view/admin_pannel/product/add_product.dart';
import '../presentation/view/authenticated/authenticated.dart';
import '../presentation/view/dashboard.dart';
import '../presentation/view/login/login.dart';
import '../presentation/view/register/register.dart';
import '../presentation/view/unathenticated/unathenticated.dart';

dynamic routes() {
  return {
    '/login': (context) => const LoginScreen(),
    '/authenticated': (context) => const Authenticated(),
    '/unauthenticated': (context) => const Unathenticated(),
    '/dashboard': (context) => const DashboardScreen(),
    '/register': (context) => const RegisterScreen(),
    '/add_product': (context) => const AddProduct(),
  };
}

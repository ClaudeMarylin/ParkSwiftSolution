import 'package:logger/logger.dart';

final Logger logger = Logger(
  printer: PrettyPrinter(),
);

typedef Json = Map<String, dynamic>;
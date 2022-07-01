

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_clean_arch/core/networkInfo/network_info.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker{}

  void main(){
    late NetworkInfoImpl networkInfoImpl;
    late MockDataConnectionChecker mockDataConnectionChecker;

    setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(connectionCheker: mockDataConnectionChecker);
  });

  group('IsConnected', (){
    test('should forward the call to DataConnectionChecker.hasConnection', () async{
      // arrange
        final tHasConnectionFuture = Future.value(true);
        when(() => mockDataConnectionChecker.hasConnection)
            .thenAnswer((_) => tHasConnectionFuture);
      // act
        final result = networkInfoImpl.isConnected;
      // assert
         verify(()=> mockDataConnectionChecker.hasConnection);
        // Utilizing Dart's default referential equality.
        // Only references to the same object are equal.
        expect(result, tHasConnectionFuture);
    });
  });

  }

  
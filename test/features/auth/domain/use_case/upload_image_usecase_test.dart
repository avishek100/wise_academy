// import 'dart:io';

// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:wise_academy/core/error/failure.dart';
// import 'package:wise_academy/features/auth/domain/use_case/upload_image_usecase.dart';

// import 'repository_mock.dart';

// void main() {
//   late MockAuthRepository mockAuthRepository;
//   late UploadImageUsecase uploadImageUsecase;

//   setUp(() {
//     mockAuthRepository = MockAuthRepository();
//     uploadImageUsecase = UploadImageUsecase(mockAuthRepository);

//     // Register fallback value for mocktail
//     registerFallbackValue(File('test_image.jpg'));
//   });

//   group('UploadImageUsecase Tests', () {
//     final file = File('test_image.jpg');
//     const uploadedImageUrl = "https://example.com/profile.jpg";

//     test('should return image URL when upload is successful', () async {
//       // Arrange
//       when(() => mockAuthRepository.uploadProfilePicture(file))
//           .thenAnswer((_) async => const Right(uploadedImageUrl));

//       // Act
//       final result = await uploadImageUsecase(UploadImageParams(file: file));

//       // Assert
//       expect(result, const Right(uploadedImageUrl));
//       verify(() => mockAuthRepository.uploadProfilePicture(file)).called(1);
//     });

//     test('should return failure when upload fails', () async {
//       // Arrange
//       final failure = ApiFailure(message: "Upload failed");
//       when(() => mockAuthRepository.uploadProfilePicture(file))
//           .thenAnswer((_) async => Left(failure));

//       // Act
//       final result = await uploadImageUsecase(UploadImageParams(file: file));

//       // Assert
//       expect(result, Left(failure));
//       verify(() => mockAuthRepository.uploadProfilePicture(file)).called(1);
//     });
//   });
// }

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wise_academy/core/error/failure.dart';
import 'package:wise_academy/features/auth/domain/use_case/upload_image_usecase.dart';

import 'repository_mock.dart';

// Concrete subclass of Failure for testing
class TestFailure extends Failure {
  const TestFailure({required super.message});
}

void main() {
  late UploadImageUsecase useCase;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = UploadImageUsecase(mockRepository);
  });

  // Test case for successful image upload
  test(
      'should call uploadProfilePicture with correct File and return image URL',
      () async {
    // Arrange
    final file = File('path/to/image.jpg');
    const imageUrl = 'https://example.com/image.jpg';

    // Mock the repository to return Right(imageUrl) for successful upload
    when(() => mockRepository.uploadProfilePicture(file))
        .thenAnswer((_) async => const Right(imageUrl));

    // Act
    final result = await useCase(UploadImageParams(file: file));

    // Assert
    expect(result,
        const Right(imageUrl)); // Verify that the result is Right(imageUrl)
    verify(() => mockRepository.uploadProfilePicture(file)).called(
        1); // Verify that uploadProfilePicture was called with the correct File
    verifyNoMoreInteractions(
        mockRepository); // Ensure no other interactions with the repository
  });

  // Test case for image upload failure
  test('should return a Failure when uploadProfilePicture fails', () async {
    // Arrange
    final file = File('path/to/image.jpg');
    const failure = TestFailure(message: 'Image upload failed');

    // Mock the repository to return Left(Failure) for failed upload
    when(() => mockRepository.uploadProfilePicture(file))
        .thenAnswer((_) async => const Left(failure));

    // Act
    final result = await useCase(UploadImageParams(file: file));

    // Assert
    expect(
        result, const Left(failure)); // Verify that the result is Left(Failure)
    verify(() => mockRepository.uploadProfilePicture(file)).called(
        1); // Verify that uploadProfilePicture was called with the correct File
    verifyNoMoreInteractions(
        mockRepository); // Ensure no other interactions with the repository
  });

  tearDown(() {
    reset(mockRepository); // Reset the mock after each test
  });
}

// Mocks generated by Mockito 5.4.0 from annotations
// in chat_astro/test/user_creation_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:chat_astro/core/utils/open_ai_utils.dart' as _i2;
import 'package:chat_astro/feature/user_creation/data/sources/user_creation_remote_data_source_impl.dart'
    as _i3;
import 'package:chat_astro/feature/user_creation/domain/entities/user_profile_entity.dart'
    as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeOpenAiUtils_0 extends _i1.SmartFake implements _i2.OpenAiUtils {
  _FakeOpenAiUtils_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [UserCreationRemoteDataSourceImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserCreationRemoteDataSourceImpl extends _i1.Mock
    implements _i3.UserCreationRemoteDataSourceImpl {
  MockUserCreationRemoteDataSourceImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.OpenAiUtils get openAiUtils => (super.noSuchMethod(
        Invocation.getter(#openAiUtils),
        returnValue: _FakeOpenAiUtils_0(
          this,
          Invocation.getter(#openAiUtils),
        ),
      ) as _i2.OpenAiUtils);
  @override
  _i4.Future<String> getUserProfileResponse(
          {required _i5.userProfileInfo? userProfileEntity}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserProfileResponse,
          [],
          {#userProfileEntity: userProfileEntity},
        ),
        returnValue: _i4.Future<String>.value(''),
      ) as _i4.Future<String>);
}

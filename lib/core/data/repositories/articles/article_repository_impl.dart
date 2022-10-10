import '../../../domain/network/response/api_response.dart';
import '../../../domain/network/service/dio_client.dart';
import '../../models/articles/article_model.dart';
import 'article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final DioClient dioClient;
  const ArticleRepositoryImpl(this.dioClient);

  @override
  Future<ApiResponse<List<ArticleModel>?>> getTopHeadlineArticles() {
    // final uri = APIHost.authorityReport + APIPath.pathReport;
    // final header = {
    //   'authority': r'rsm2021-d3bzmmng.an.gateway.dev',
    //   'accept': r'application/json, text/plain, */*',
    //   'accept-language': r'vi-VN,vi;q=0.9,en-US;q=0.8,en;q=0.7',
    //   'language': r'vi',
    //   'origin': r'https://powerhub.nexlesoft.com/',
    //   'ree_token':
    //       r'b5f5443b8fae5b4736f672acecfabe10.T1664260834194.83cbbfa0afbe4c4baf19899464b7e2c6',
    //   'referer': r'https://powerhub.nexlesoft.com/',
    //   'x-api-key': 'AIzaSyBS6rQ_3nB2TN6NCnFlCzhMYeRGL3WEhZI',
    //   'x-dev-db-key':
    //       'c508828c6779fe5b07f9770b0ddf2d1f.T1634806896324.6fa577c015f3345f816c1c1f68fd1e5c',
    //   'x-user-agent-t':
    //       'bfe6f00df8f7aefbd2660be0d5810cfd.T1629692448457.e048a206b8af0918f3a61cd125ba32e4',
    // };
    // final queryParams = {
    //   r'projectIds[0]': '137',
    //   r'projectIds[1]': '138',
    //   'fromDate': '2022-07-04',
    //   'toDate': '2022-08-04'
    // };
    return dioClient.get(
      'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=5112ca0d3fee4f6cb6d50b6e35c6927e',
      //queryParameters: queryParams,
      //options: Options(headers: header),
      mapper: (json) {
        final data =
            List<Map<String, dynamic>>.from(json as List<ArticleModel>? ?? [])
                .map((e) {
          return ArticleModel.fromJson(e);
        }).toList();
        return data;
      },
    );
  }
  // final ArticleRemoteDataSource remoteDataSource;
  // final ArticleLocalDataSource localDataSource;
  // final NetworkInfo networkInfo;

  // ArticleRepositoryImpl({
  //   required this.remoteDataSource,
  //   required this.localDataSource,
  //   required this.networkInfo
  // });

  // @override
  // Future<Either<Failure, List<Article>>> getTopHeadlineArticles() async {
  //   if (await networkInfo.isConnected) {
  //     try {
  //       final result = await remoteDataSource.getTopHeadlineArticles();
  //       localDataSource.cacheTopHeadlineArticles(
  //           result.map((article) => ArticleTable.fromDTO(article)).toList());
  //       return Right(result.map((model) => model.toEntity()).toList());
  //     } on ServerException {
  //       return Left(ServerFailure(''));
  //     } on TlsException catch (e) {
  //       return Left(CommonFailure('Certificated Not Valid:\n${e.message}'));
  //     }
  //   } else {
  //     try {
  //       final result = await localDataSource.getCachedTopHeadlineArticles();
  //       return Right(result.map((model) => model.toEntity()).toList());
  //     } on CacheException catch (e) {
  //       return Left(CacheFailure(e.message));
  //     }
  //   }
  // }

  @override
  Future<ApiResponse<List<ArticleModel>>> getArticleCategory(String category) {
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<List<ArticleModel>>> getBookmarkArticles() {
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<List<ArticleModel>>> getHeadlineBusinessArticles() {
    throw UnimplementedError();
  }

  @override
  Future<bool> isAddedToBookmarkArticle(String url) {
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<String>> removeBookmarkArticle(ArticleModel article) {
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<String>> saveBookmarkArticle(ArticleModel article) {
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<ArticleModel>> searchArticles(String query,
      {int page = 1}) {
    throw UnimplementedError();
  }

  // @override
  // Future<Either<Failure, List<Article>>> getHeadlineBusinessArticles() async {
  //   if (await networkInfo.isConnected) {
  //     try {
  //       final result = await remoteDataSource.getHeadlineBusinessArticles();
  //       localDataSource.cacheHeadlineBusinessArticles(
  //           result.map((article) => ArticleTable.fromDTO(article)).toList());
  //       return Right(result.map((model) => model.toEntity()).toList());
  //     } on ServerException {
  //       return Left(ServerFailure(''));
  //     } on TlsException catch (e) {
  //       return Left(CommonFailure('Certificated Not Valid:\n${e.message}'));
  //     }
  //   } else {
  //     try {
  //       final result = await localDataSource.getCachedHeadlineBusinessArticles();
  //       return Right(result.map((model) => model.toEntity()).toList());
  //     } on CacheException catch (e) {
  //       return Left(CacheFailure(e.message));
  //     }
  //   }
  // }

  // @override
  // Future<Either<Failure, List<Article>>> getArticleCategory(String category) async {
  //   try {
  //     final result = await remoteDataSource.getArticleCategory(category);
  //     return Right(result.map((model) => model.toEntity()).toList());
  //   } on ServerException {
  //     return Left(ServerFailure(''));
  //   } on SocketException {
  //     return Left(ConnectionFailure('Failed to connect to the network'));
  //   } on TlsException catch (e) {
  //     return Left(CommonFailure('Certificated Not Valid:\n${e.message}'));
  //   }
  // }

  // @override
  // Future<Either<Failure, Articles>> searchArticles(String query, {int page: 1}) async {
  //   try {
  //     final result = await remoteDataSource.searchArticles(query, page);
  //     return Right(result.toEntity());
  //   } on ServerException {
  //     return Left(ServerFailure(''));
  //   } on SocketException {
  //     return Left(ConnectionFailure('Failed to connect to the network'));
  //   } on TlsException catch (e) {
  //     return Left(CommonFailure('Certificated Not Valid:\n${e.message}'));
  //   }
  // }

  // @override
  // Future<Either<Failure, String>> saveBookmarkArticle(Article article) async {
  //   try {
  //     final result =
  //         await localDataSource.insertBookmarkArticle(ArticleTable.fromEntity(article));
  //     return Right(result);
  //   } on DatabaseException catch (e) {
  //     return Left(DatabaseFailure(e.message));
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  // @override
  // Future<Either<Failure, String>> removeBookmarkArticle(Article article) async {
  //   try {
  //     final result =
  //         await localDataSource.removeBookmarkArticle(ArticleTable.fromEntity(article));
  //     return Right(result);
  //   } on DatabaseException catch (e) {
  //     return Left(DatabaseFailure(e.message));
  //   }
  // }

  // @override
  // Future<bool> isAddedToBookmarkArticle(String url) async {
  //   final result = await localDataSource.getArticleByUrl(url);
  //   return result != null;
  // }

  // @override
  // Future<Either<Failure, List<Article>>> getBookmarkArticles() async {
  //   final result = await localDataSource.getBookmarkArticles();
  //   return Right(result.map((data) => data.toEntity()).toList());
  // }
}

///Base URL
const kBaseURL='https://api.themoviedb.org/3';

///End Points
const kGetNowPlayingEndPoint='/movie/now_playing';
const kGetPopularMovieEndPoint = '/movie/popular';
const kGetGenerEndPoint = '/genre/movie/list';
const kGetGenreMovieEndPoint = '/discover/movie';
const kGetActorEndPoint = '/person/popular';
const kGetDetailEndPoint = '/movie/{$kPath}';
const kGetDetailCastAndCrewEndPoint = '/movie/{$kPath}/credits';
const kGetSimilarMovieEndPoint = '/movie/{$kPath}/similar';


//Token API Key
const kApiKey='6ba57a8fa213613268b61de49d70fffe';

// Query Path
const kPath = 'movie_id';


///Query Params
const kQueryParamsAPIKey='api_key';
const kQueryParamsPage='page';
const kQueryParamsGenre = "with_genres";

///Image Constant
const kPrefixImageLink='https://image.tmdb.org/t/p/w500';
const kDefaultImage='https://user-images.githubusercontent.com/43302778/106805462-7a908400-6645-11eb-958f-cd72b74a17b3.jpg';
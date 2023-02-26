
///Base URL
const kBaseURL='https://api.themoviedb.org/3';

///End Points
const kGetNowPlayingEndPoint='/movie/now_playing';
const kPopularMovieEndPoint = '/movie/popular';
const kGenresEndPoint = '/genre/movie/list';
const kGenresMoviesEndPoint = '/discover/movie';
const kActorsMovieEndPoint = '/person/popular';
const kDetailsEndPoint = '/movie/{$kPathParameterMovieID}';
const kCastAndCrewEndPoint = '/movie/{$kPathParameterMovieID}/credits';
const kSimilarEndPoint = '/movie/{$kPathParameterMovieID}/similar';



//Token API Key
//const kApiKey='20e035b39e8c32f801141784a5f68809';
const kApiKey='6ba57a8fa213613268b61de49d70fffe';


///Query Params
const kQueryParamsAPIKey='api_key';
const kQueryParamsPage='page';
const kQueryWithGenres = 'with_genres';
const kPathParameterMovieID = 'movie_id';


///Image Constant
const kPrefixImageLink='https://image.tmdb.org/t/p/w500';
const kDefaultImage='https://user-images.githubusercontent.com/43302778/106805462-7a908400-6645-11eb-958f-cd72b74a17b3.jpg';
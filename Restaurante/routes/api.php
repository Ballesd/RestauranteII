<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ArticuloController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});


Route::get('/products', 'App\Http\Controllers\ProductController@index'); //Muestra un producto
Route::post('/products', 'App\Http\Controllers\ProductController@store'); //Crea un producto
Route::put('/products/{id}', 'App\Http\Controllers\ProductController@update'); //Edita los datos
Route::delete('/products/{id}', 'App\Http\Controllers\ProductController@destroy'); //Borra datos 
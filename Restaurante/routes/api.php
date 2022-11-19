<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/products', 'App\Http\Controllers\CategoryProductController@getProductsByCategory');

//Orders routes
Route::get('/orders', 'App\Http\Controllers\OrderProductController@index'); //Trae todos los pedidos
Route::post('/orders', 'App\Http\Controllers\OrderProductController@store'); //Crea un pedido
Route::put('/orders/{id}', 'App\Http\Controllers\OrderProductController@update'); //Actualiza un pedido
Route::post('orders/products', 'App\Http\Controllers\OrderProductController@saveOrderProduct'); //Agrega un producto a un pedido
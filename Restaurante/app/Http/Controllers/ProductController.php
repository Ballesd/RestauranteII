<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Models\Product;


class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $producto = Product::all();
        return $producto;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:50',
            'description' => 'string|max:255',
            'price' => 'required|integer|min:2',
            'image' => 'string',
            'type' => 'required|string',

        ]);

        $producto = new Product();
        $producto->name = $request->name;
        $producto->description = $request->description;
        $producto->price = $request->price;
        $producto->image = $request->image;
        $producto->type = $request->type;

        $producto->save();
        

        /*Probar la respuesta en caso de error
        if($validator->fails()){
            return \response('Algunos campos son nulos o tienen información inconsistente');
        }*/
        
    }
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        /*$validator = Validator::make($request->all(), [
            'name' => 'required|string|max:50',
            'description' => 'string|max:255',
            'price' => 'required|integer|min:2',
            'image' => 'string',
            'type' => 'required|string',

        ]);*/

        $producto = Product::findOrFail($request->id);

        $producto->name = $request->name;
        $producto->description = $request->description;
        $producto->price = $request->price;
        $producto->image = $request->image;
        $producto->type = $request->type;

        $producto->save();

        return $producto;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $producto = Product::destroy($request->id);
        return($producto);
    }
}

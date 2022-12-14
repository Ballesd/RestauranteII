<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\Product; 
use App\Models\OrderProduct;


class OrderProductController extends Controller
{
        /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $products = Order::where('status',1)->get();
        return response()->json($products);
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $order = new Order();
        $order->description = $request->description;
        $order->total = $request->total;
        $order->status = 1;
        $order->save();

        //Sacar el id del la orden recien guardada
        $id = $order->id;
        return response()->json($id);
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
        $order = Order::find($request->id);
        $order->status = 0;
        $order->save();

        return $order;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
    public function getOrdersByProduct(Request $request){
        //
    }

    //Funcion para guardar los productos de la orden
    public function saveOrderProduct(Request $request){

        $orderProduct = new OrderProduct();

        $orderProduct->quantity = $request->quantity;
        $orderProduct->subtotal = $request->subtotal;
        $orderProduct->order_id = $request->order_id;
        $orderProduct->product_id = $request->product_id;
        
        $orderProduct->save();
    }
}

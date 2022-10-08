<template>
    <div>
        <h1>Detalles de una tabla desde un componente</h1>
    </div>

	<section>
		<div class="table w-full p-2">
        <table class="w-full border">
            <thead>
                <tr class="bg-gray-50 border-b">
                    <th class="p-2 border-r cursor-pointer text-sm font-thin text-gray-500">
                        <div class="flex items-center justify-center">
                            ID
                        </div>
                    </th>
                    <th class="p-2 border-r cursor-pointer text-sm font-thin text-gray-500">
                        <div class="flex items-center justify-center">
                            Name
                        </div>
                    </th>
                    <th class="p-2 border-r cursor-pointer text-sm font-thin text-gray-500">
                        <div class="flex items-center justify-center">
                            Email
                        </div>
                    </th>
                    <th class="p-2 border-r cursor-pointer text-sm font-thin text-gray-500">
                        <div class="flex items-center justify-center">
                            Address

                        </div>
                    </th>
                    <th class="p-2 border-r cursor-pointer text-sm font-thin text-gray-500">
                        <div class="flex items-center justify-center">
                            Action
                        </div>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr class="bg-gray-100 text-center border-b text-sm text-gray-600">
    
                    <td class="p-2 border-r">1</td>
                    <td class="p-2 border-r">John Doe</td>
                    <td class="p-2 border-r">john@gmail.com</td>
                    <td class="p-2 border-r">Sydney, Australia</td>
                    <td>
                        <a href="#" class="bg-blue-500 p-2 text-white hover:shadow-lg text-xs font-thin">Editar</a>
                        <a href="#" class="bg-red-500 p-2 text-white hover:shadow-lg text-xs font-thin">Eliminar</a>
                    </td>
                </tr>
                <tr class="bg-gray-100 text-center border-b text-sm text-gray-600">
                    <td class="p-2 border-r">2</td>
                    <td class="p-2 border-r">Adam Smith</td>
                    <td class="p-2 border-r">adam@gmail.com</td>
                    <td class="p-2 border-r">Sydney, Australia</td>
                    <td>
                        <a href="#" class="bg-blue-500 p-2 text-white hover:shadow-lg text-xs font-thin">Editar</a>
                        <a href="#" class="bg-red-500 p-2 text-white hover:shadow-lg text-xs font-thin">Eliminar</a>
                    </td>
                </tr>
                <tr class="bg-gray-100 text-center border-b text-sm text-gray-600">
                    <td class="p-2 border-r">3</td>
                    <td class="p-2 border-r">Jean Doe</td>
                    <td class="p-2 border-r">jean@gmail.com</td>
                    <td class="p-2 border-r">Sydney, Australia</td>
                    <td>
                        <a href="#" class="bg-blue-500 p-2 text-white hover:shadow-lg text-xs font-thin">Editar</a>
                        <a href="#" class="bg-red-500 p-2 text-white hover:shadow-lg text-xs font-thin">Eliminar</a>
                    </td>
                </tr>
                <tr class="bg-gray-100 text-center border-b text-sm text-gray-600">
                    <td class="p-2 border-r">3</td>
                    <td class="p-2 border-r">Jean Doe</td>
                    <td class="p-2 border-r">jean@gmail.com</td>
                    <td class="p-2 border-r">Sydney, Australia</td>
                    <td>
                        <a href="#" class="bg-blue-500 p-2 text-white hover:shadow-lg text-xs font-thin">Edit</a>
                        <a href="#" class="bg-red-500 p-2 text-white hover:shadow-lg text-xs font-thin">Remove</a>
                    </td>
                </tr>
                <tr class="bg-gray-100 text-center border-b text-sm text-gray-600">
                    <td class="p-2 border-r">3</td>
                    <td class="p-2 border-r">Jean Doe</td>
                    <td class="p-2 border-r">jean@gmail.com</td>
                    <td class="p-2 border-r">Sydney, Australia</td>
                    <td>
                        <a href="#" class="bg-blue-500 p-2 text-white hover:shadow-lg text-xs font-thin">Edit</a>
                        <a href="#" class="bg-red-500 p-2 text-white hover:shadow-lg text-xs font-thin">Remove</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
	</section>
</template>


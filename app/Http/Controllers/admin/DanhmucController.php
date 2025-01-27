<?php

namespace App\Http\Controllers\admin;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use App\Models\Danhmuc;

use App\Repositories\IDanhmucRepository;

class DanhmucController extends Controller
{

    private $DanhmucRepository;
    private $category;

    public function __construct(IDanhmucRepository $DanhmucRepository, Danhmuc $category) {

        $this->DanhmucRepository = $DanhmucRepository;
        $this->category= $category;
    }

    public function index(){
        $Danhmucs = $this->DanhmucRepository->allDanhmuc();
        $categories = Danhmuc::latest()->paginate(5);
        return view('admin.danhmucs.index', compact('Danhmucs','categories'));
    }

    public function create(){
        return view('admin.danhmucs.create');
    }

    public function store(Request $request){

        $validatedData = $request->validate([
            'ten_danhmuc' => 'required',
        ]);

        $this->DanhmucRepository->storeDanhmuc($validatedData);

        return redirect()->route('danhmuc.index');
    }

    public function edit($id){
        $danhmuc = $this->DanhmucRepository->findDanhmuc($id);
        return view('admin.danhmucs.edit', ['danhmuc' => $danhmuc]);
    }

    public function update($id, Request $request){
        $validatedData = $request->validate([
            'ten_danhmuc' => 'required',
        ]);
        $this->DanhmucRepository->updateDanhmuc($validatedData, $id);

        return redirect()->route('danhmuc.index')->with('success', 'Cập nhập danh mục thành công');
    }

    public function destroy($id){
        $this->DanhmucRepository->deleteDanhmuc($id);

        return redirect()->route('danhmuc.index')->with('success', 'Xóa danh mục thành công');
    }

}

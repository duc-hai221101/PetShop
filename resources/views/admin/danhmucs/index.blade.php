@extends('admin_layout')
@section('admin_content')

<h1 class="h3 mb-3"><strong>Danh sách danh mục</strong></h1>

<div class="">
  @if(session()->has('success'))
      <div class="alert alert-success mb-3">
          {{ session('success') }}
      </div>
  @endif
</div>

<a class="btn btn-primary mb-3" href="{{ route('danhmuc.create') }}">Thêm danh mục</a>

<table class="table table-striped table-hover">
  <thead class="table-dark">
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Tên danh mục</th>
      <th scope="col" class="text-center">Hành động</th>
    </tr>
  </thead>

  <tbody>
    @foreach($categories as $Danhmuc)
    <tr>
      <td>{{ $Danhmuc->id_danhmuc }}</td>
      <td>{{ $Danhmuc->ten_danhmuc }}</td>
      <td class="text-center">
        <div class="d-flex gap-2 justify-content-center">
          <a href="{{ route('danhmuc.edit', ['danhmuc' => $Danhmuc]) }}" class="btn btn-warning">Sửa</a>
          <form method="POST" action="{{ route('danhmuc.destroy', ['danhmuc' => $Danhmuc]) }}" class="d-inline">
            @csrf
            @method('DELETE')
            <button type="submit" class="btn btn-danger"
              onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục này không?')">
              Xóa
            </button>
          </form>
        </div>
      </td>
    </tr>
    @endforeach
  </tbody>
</table>
<nav aria-label="Page navigation example" class="d-flex justify-content-center">
  {{ $categories->links() }}

</nav>
@endsection

@extends('admin_layout')

@section('admin_content')
<h1 class="h3 mb-4"><strong>Danh sách sản phẩm</strong></h1>

<div class="mb-3">
    @if(session()->has('success'))
        <div class="alert alert-success" role="alert">
            {{ session('success') }}
        </div>
    @endif
</div>

<div class="d-flex justify-content-between mb-4">
    <a class="btn btn-success" href="{{ route('product.create') }}">Thêm sản phẩm</a>

    <form action="{{ route('adminSearch') }}" method="GET" class="d-flex">
        <input type="text" value="" placeholder="Nhập để tìm kiếm..." name="tukhoa" class="form-control me-2" style="width: 250px;" required>
        <button class="btn btn-primary" type="submit">
            <i class="align-middle" data-feather="search"></i> Tìm kiếm
        </button>
    </form>
</div>

<div class="table-responsive">
    <table class="table table-striped table-hover align-middle">
      <thead class="table-dark">
        <tr>
            <th scope="col" style="white-space: nowrap;">Tên sản phẩm</th>
            <th scope="col" style="white-space: nowrap;">Hình ảnh</th>
            <th scope="col" style="white-space: nowrap;">Số lượng</th>
            <th scope="col" style="white-space: nowrap;">Giá gốc</th>
            <th scope="col" style="white-space: nowrap;">Giảm giá</th>
            <th scope="col" style="white-space: nowrap;">Giá khuyến mại</th>
            <th scope="col" colspan="2" style="white-space: nowrap;">Hành động</th>
        </tr>
    </thead>
    
        </thead>
        <tbody>
            @foreach($products as $product)
            <tr>
                <td>{{ $product->tensp }}</td>
                <td><img src="{{ asset($product->anhsp) }}" width="80" height="80" alt="" class="img-thumbnail"></td>
                <td>{{ $product->soluong }}</td>
                <td>{{ number_format($product->giasp, 0, ',', '.') }} VND</td>
                <td>
                    @if ($product->giamgia)
                        {{ $product->giamgia }}%
                    @else
                        Không
                    @endif
                </td>
                <td>{{ number_format($product->giakhuyenmai, 0, ',', '.') }} VND</td>
                <td class="text-center">
    <div class="d-flex gap-2 justify-content-center">
        <a href="{{ route('product.edit', ['product' => $product]) }}" class="btn btn-warning">
            Sửa
        </a>
        <form method="POST" action="{{ route('product.destroy', ['product' => $product]) }}">
            @csrf
            @method('DELETE')
            <button type="submit" class="btn btn-danger"
                    onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này không?')">
                Xóa
            </button>
        </form>
    </div>
</td>

            </tr>
            @endforeach
        </tbody>
    </table>
</div>

<nav aria-label="Page navigation example" class="d-flex justify-content-center">
  {{ $products->links() }}

</nav>
@endsection

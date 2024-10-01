@extends('layout')
@section('content')
    <!--Main-->
    <div class="body" style="padding-top: 50px;">
        <a class="buy_continute" href="{{URL::to('/')}}"><i class="fa fa-arrow-circle-left"></i> Trở lại mua hàng</a>
        @if(session('success'))
            <div class="alert alert-success mt-3">
            {{ session('success') }}
            </div> 
        @endif
            <div class="product_card mt-3">
                <div class="product__details-img mr-2">
                    <div class="big-img">
                        <img src="{{ asset($sanpham->anhsp) }}" alt="" id="zoom" style="visibility: visible;">
                    </div>
                    {{-- <div class="small-img d-flex mt-2">
                            <img src="./img/dohop.jpg" onerror="this.onerror=null; this.src='https://i.pinimg.com/originals/ae/4c/9e/ae4c9ea2edf887f6ad1e4e63cfae05b0.jpg'" class="small-imgg" alt="">
                            <img src="./img/dohop.jpg" onerror="this.onerror=null; this.src='https://i.pinimg.com/originals/ae/4c/9e/ae4c9ea2edf887f6ad1e4e63cfae05b0.jpg'" class="small-imgg" alt="">
                            <img src="./img/dohop.jpg" onerror="this.onerror=null; this.src='https://i.pinimg.com/originals/ae/4c/9e/ae4c9ea2edf887f6ad1e4e63cfae05b0.jpg'" class="small-imgg" alt="">
                            <img src="./img/dohop.jpg" onerror="this.onerror=null; this.src='https://i.pinimg.com/originals/ae/4c/9e/ae4c9ea2edf887f6ad1e4e63cfae05b0.jpg'" class="small-imgg" alt="">
                    </div> --}}
                </div>
    
                <div class="product__details-info">
                    <h3 style="margin-top: unset; line-height: unset;">{{ $sanpham->tensp }}</h3>
                    <div class="short-des">
                        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ullam sit aliquid debitis voluptates ducimus, quasi iusto nam quaerat eius quidem.
    
                    </div><hr />
    
                    <div class="product__pride">
                        <div class="product__pride-oldPride" style="font-size: 20px; text-align: start;">
                            <span class="Price">
                                <bdi>
                                    {{ number_format($sanpham->giasp, 0, ',', '.') }}  
                                    <span class="currencySymbol">₫</span>
                                </bdi>
                            </span>
                        </div>
                        <div class="product__pride-newPride" style="font-size: 40px; text-align: start;">
                            <span class="Price">
                                <bdi>{{ number_format($sanpham->giakhuyenmai, 0, ',', '.') }}  
                                    <span class="currencySymbol">₫</span>
                                </bdi>
                            </span>
                        </div>
    
                    </div>
    
                    <form action="" method="POST">
                        <!--
                            <div class="number">
                                <span>Số lượng</span>
                                <div class="number__count">
                                    <input type="number" value="1" min="1" max="10" name="quantity">
                                    <input type="hidden" name="id" value="<?php //echo $valueID['id_sanpham']; ?>">
                                </div>
                            </div>
                        -->
    
                        <div class="number">
                            <span>
                                Số lượng
                                <span class="number__count">
                                    {{$sanpham->soluong}}    
                                </span>
                            </span>
    
                        </div>
    
                        <div class="product__cart">
                            <a href="{{ route('add_to_cart', $sanpham->id_sanpham) }}" class="product__cart-add" name="add-to-cart">
                                Thêm vào giỏ hàng
                            </a>
                            <a href="{{ route('add_go_to_cart', $sanpham->id_sanpham) }}" class="product__cart-buy" name="buy-now">Mua ngay</a>
                        </div>
    
                    </form>
                </div>
            </div>
    
        <!--Mô tả sản phẩm-->
        <div class="body__mainTitle">
            <h2>MÔ TẢ SẢN PHẨM</h2>
        </div>
            {{$sanpham->mota}}    
        <hr />
    
         <!-- Bình luận sản phẩm -->
    <div class="body__mainTitle">
        <h2>BÌNH LUẬN</h2>
    </div>

  <!-- Hiển thị bình luận -->
@foreach($sanpham->comments as $comment)
<div class="d-flex justify-content-between align-items-center mb-2">
    <div class="d-flex">
        <img src="{{ asset('frontend/img/user.jpg') }}" width="45" height="45" style="border-radius: 50%;" />
        <div class="pl-3">
            <b>{{ $comment->khachhang ? $comment->khachhang->hoten : 'Người dùng không xác định' }}</b>
            <div style="line-height: 30px;">{{ $comment->content }}</div>
            <div>{{ $comment->created_at->format('d/m/Y H:i') }}</div>
        </div>
    </div>
</div>
<hr />
@endforeach

    <!-- Form gửi bình luận -->
    <form action="{{ route('comments.store') }}" method="POST">
        @csrf
        <div class="form-group">
            <label for="content">Nội dung bình luận:</label>
            <textarea name="content" class="form-control" style="outline: none; margin-bottom: 5px;" required></textarea>
            <input type="hidden" name="sanpham_id" value="{{ $sanpham->id_sanpham }}">
        </div>
        <button type="submit" class="btn btn-maincolor">Gửi bình luận</button>
    </form>

    <hr>
    <hr>
        <!-- Sản phẩm ngẫu nhiên -->
        <div class="body__mainTitle">
            <h2>CÓ THỂ BẠN CŨNG THÍCH</h2>
        </div>
        <div class="row">
            @foreach($randoms as $random)
            <div class="col-lg-2_5 col-md-4 col-6 post2">
                <a href="{{ route('detail', ['id' => $random->id_sanpham]) }}">
                    <div class="product">
                        <div class="product__img">
                            <img src="{{ asset($random->anhsp)}}" alt="">
                        </div>
                        <div class="product__sale">
                            <div>
                                @if($random->giamgia)
                                    -{{$random->giamgia}}%
                                @else Mới
                                @endif
                            </div>
                        </div>

                        <div class="product__content">
                            <div class="product__title">
                                {{$random->tensp}}
                            </div>

                            <div class="product__pride-oldPride">
                                <span class="Price">
                                    <bdi>
                                        {{ number_format($random->giasp, 0, ',', '.') }}
                                        <span class="currencySymbol">₫</span>
                                    </bdi>
                                </span>
                            </div>

                            <div class="product__pride-newPride">
                                <span class="Price">
                                    <bdi>
                                        {{ number_format($random->giakhuyenmai, 0, ',', '.') }}
                                        <span class="currencySymbol">₫</span>
                                    </bdi>
                                </span>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            @endforeach
        </div>
    </div>
@endsection
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    use HasFactory;

    protected $fillable = ['user_id', 'sanpham_id', 'content'];

    public function khachhang()
    {
        return $this->belongsTo(KhachHang::class, 'user_id', 'id_kh'); // Điều chỉnh tên khóa nếu cần
    }

    public function sanpham()
    {
        return $this->belongsTo(Sanpham::class, 'sanpham_id');
    }
}

<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Comment;

class CommentController extends Controller
{
    public function store(Request $request)
    {
        $request->validate([
            'content' => 'required',
            'sanpham_id' => 'required|exists:sanpham,id_sanpham',
        ]);

        Comment::create([
            'user_id' => auth()->id(),
            'sanpham_id' => $request->sanpham_id,
            'content' => $request->content,
        ]);

        return back()->with('success', 'Bình luận của bạn đã được gửi.');
    }
}
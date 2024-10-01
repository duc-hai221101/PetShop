<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Khachhang;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function index(){
        return view('pages.login');
    }
    public function register(){
        return view('pages.register');
    }
    public function registerPost(Request $request)
    {
        // Validation
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:khachhang,email',
            'password' => 'required|string|min:8|confirmed',
            'address' => 'required|string|max:255',
            'phone' => 'required|digits_between:10,15',
        ]);
    
        // Lưu thông tin khách hàng
        Khachhang::create([
            'hoten' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'diachi' => $request->address,
            'sdt' => $request->phone,
            'id_phanquyen' => 2,
        ]);
    
        // Trả về với thông báo thành công
        return back()->with('thongbao', 'Đăng ký tài khoản thành công');
    }

    public function loginPost(Request $request){
        $credetials = [
            'email' => $request->email,
            'password' => $request->password
        ];

        if(Auth::attempt($credetials)){
            return redirect('/')->with('thongbao', 'Đăng nhập thành công');
        }

        return back()->with('error', 'Sai tên tài khoản hoặc mật khẩu');
    }

    public function logout(){
        Auth::logout();
        return redirect('/');
    }
}

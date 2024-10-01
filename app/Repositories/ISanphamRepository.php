<?php
namespace App\Repositories;

interface ISanphamRepository{
    public function allProduct();
    public function relatedProduct();
    public function randomProduct();
    public function dogProduct();
    public function catProduct();
    public function forDog();
    public function forCat();
    public function searchProduct($data);
    public function viewAllWithPagi();
}
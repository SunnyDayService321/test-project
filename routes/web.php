<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TestController;
use App\Http\Controllers\PostController;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/test', [TestController::class, 'test'])->name('test');

// Route::resource('posts', PostController::class);
// Route::resource('posts', PostController::class)->only(['index', 'create', 'store']);
Route::get('/post/create', [PostController::class, 'create'])->name('post.cteate');
Route::post('/post', [PostController::class, 'store'])->name('post.store');
Route::get('/post/index', [PostController::class, 'index'])->name('post.index');
Route::get('/post/show/{id}', [PostController::class, 'show'])->name('post.show');
Route::get('/post/{post}/edit', [PostController::class, 'edit'])->name('post.edit');
Route::patch('/post/{post}', [PostController::class, 'update'])->name('post.update');
Route::delete('/post/{post}', [PostController::class, 'destroy'])->name('post.destroy');

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

// Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
// });

require __DIR__.'/auth.php';

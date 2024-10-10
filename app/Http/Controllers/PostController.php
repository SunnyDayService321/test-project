<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Post;
use Illuminate\Support\Facades\Gate;

class PostController extends Controller
{
    public function create()
    {
        return view('post.create');
    }

    public function store(Request $request)
    {
        // Gate::authorize('test');
        $validated = $request->validate([
            'title' => 'required|max:20',
            'body' => 'required|max:400',
        ]);

        $validated['user_id'] = auth()->id();
        $post = Post::create($validated);
        return redirect()->route('post.index')->with('message', '保存しました');
    //     $request->session()->flash('message', '保存しました');
    //     return back();
    }

    public function index()
    {
        // $posts=Post::all();
        $posts=Post::paginate(10);
        return view('post.index', compact('posts'));
    }

    public function show($id)
    {
        $post=Post::find($id);
        return view('post.show', compact('post'));
    }

    public function edit(post $post)
    {
        return view('post.edit', compact('post'));
    }

    public function update(Request $request, Post $post)
    {
        $validated = $request->validate([
            'title' => 'required|max:20',
            'body' => 'required|max:400',
        ]);

        $validated['user_id'] = auth()->id();

        $post->update($validated);
        // $request->session()->flash('message', '更新しました');
        // return back();
        return redirect()->route('post.index')->with('message', '更新しました');
    }

    public function destroy(Request $request, post $post)
    {
        $post->delete();
        return redirect()->route('post.index')->with('message', '投稿を削除しました');
        // $request->session()->flash('message', '削除しました');
        // return redirect('post');
    }
}


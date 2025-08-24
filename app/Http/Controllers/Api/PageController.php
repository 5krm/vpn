<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Page;

class PageController extends BaseController
{
    public function getPages() {
        try {
            $pages = Page::all();
            
            return $this->formatResponse('Pages retrieved successfully', $pages);

        }catch(\Exception $e){
            return $this->handleException($e);
        }
 
    }

    public function getPageContentBySlug($slug)
    {
        try {
            $page = Page::where('slug', $slug)->first();

            return $this->formatResponse('Page content retrieved successfully', $page);

        } catch (Exception $e) {
            return $this->handleException($e);
        }   
    }
}

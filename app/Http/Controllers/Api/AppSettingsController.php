<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\AppSetting;

class AppSettingsController extends BaseController
{
    public function getAppSettingsData() {
        try {
            $appSettingsData = AppSetting::first();
            
            return $this->formatResponse('App settings data retrieved successfully', $appSettingsData);

        }catch(\Exception $e){
            return $this->handleException($e);
        }
 
    }
}

<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreJobRequest;
use App\Models\RequestForm;
use Illuminate\Http\Request;

class RequestFormController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreJobRequest $request)
    {
        //links the job to the user and the school that created it
        $validated = $request->validated();
        $request->user()->school->jobs()->create($validated);

        $params = $request->only([
            'school_id',
            'subject_id',
            'keystage_id',
            'date',
            'user_id',
            'user_id'
        ]);

        RequestForm::create($params);

        return 'Done';
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\RequestForm   $requests
     * @return \Illuminate\Http\Response
     */
    public function show(RequestForm $requests)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\RequestForm   $requests
     * @return \Illuminate\Http\Response
     */
    public function edit(RequestForm $requests)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\RequestForm   $requests
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, RequestForm $requests)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\RequestForm   $requests
     * @return \Illuminate\Http\Response
     */
    public function destroy(RequestForm $request)
    {
        //
    }
}

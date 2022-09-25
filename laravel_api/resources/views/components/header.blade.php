<!-- navbar -->
<!-- shadow -->
<nav class="navbar-light shadow" style="background-color: #486452;">
  <div class=" container">
    <div class="row">

      <div class="col-1">
        <a class="navbar-brand" href="{{route('dashboard.index')}}">
          <img src="/webRes/logo_web_white.png" width="100" height="60" class="d-inline-block align-top navbar_brand"
            alt="">
        </a>
      </div>
      <div class="col-4">
        <h2 class="d-inline-block align-top navbar_brand" style="margin-bottom: 0px; margin-top: 10px; color: white;">
          Cup of
          Calisthenics</h2>

      </div>
      <div class="col-7 gx-0 px-1">
        <div class="btn-group" role="group" style="margin-bottom: 0px; margin-top: 15px;">

          <ul class="nav-item gx-0 px-1"><a class=" btn justify-content-center" role="button"
              href="{{ route('dashboard.index') }}"
              style="background-color: #CFE4C4;  color: black; width: 120px">home</a>
          </ul>

          <ul class="nav-item gx-0 px-1"><a class="btn  justify-content-center" role="button"
              href="https://github.com/alice-gc/excercise"
              style="background-color: #CFE4C4;  color: black; width: 120px">github
              repo</a>
          </ul>

          <ul class="nav-item gx-0 px-1"><a class="btn  justify-content-center" role="button"
              href="{{ route('license') }}" style="background-color: #CFE4C4;  color: black; width: 120px">app
              license</a>
          </ul>

          <ul class="nav-item gx-0 px-1"><a class="btn  justify-content-center" role="button" href="https://play.google.com/store/apps/details?id=live.cupof.exercise
" style="background-color: #CFE4C4;  color: black; width: 120px">mobile
              App</a>
          </ul>


          <ul class="nav-item gx-0 px-1"><a class="btn  justify-content-center" role="button"
              href="{{ route('links') }}" style="background-color: #CFE4C4;  color: black; width: 120px">links</a>
          </ul>
        </div>
      </div>
    </div>

  </div>
</nav>
<!-- navbar end -->
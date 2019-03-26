<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Profile</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="resources\CSS\slick.css">
    <link rel="stylesheet" type="text/css" href="resources\CSS\slick-theme.css">
    <link rel="stylesheet" type="text/css" href="resources\CSS\bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="resources\CSS\profile.css">
</head>
<body>
    <header  class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
        <div class="container-fluid ">
            <a class="navbar-brand col-sm-3 col-md-3 mr-0" href="#">LIBRORUM</a>
            <div class="search-profile col-md-6 justify-content-center">
                <form class="form-inline search">
                        <input type="text" class="searchTerm" placeholder="What are you want to search?">
                        <button type="submit" class="searchButton">
                          <img src="resources\pic\search-128.png" height="32px" alt="">
                       </button>
                  </form>
            </div>
            <div class="col-md-3 text-right">
                <p class="text-light d-inline">Hey, Nikita</p>
                <a class=" d-inline" href="/logout"><img src="resources\pic\logout-64.png" height="32px" alt=""></a>
            </div>
            
        </div>
    </header>
    <div class="content">
        
        <h2 class="mt-2">My Accounts</h2>
        <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item active" aria-current="page">Home</li>
                  <li class="breadcrumb-item active" aria-current="page">My Accounts</li>
                  <li class="breadcrumb-item active" aria-current="page">Reserve</li>
                </ol>
              </nav>


    <div class="row">
    <nav class="col-2 text-center">
            <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                    <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">Online Read</a>
                    <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">My Book</a>
                    <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">In Reserve</a>
                  </div>
    </nav>
    
    <section class="col-10">
        <div class="account-content">
            <div class="tab-content" id="v-pills-tabContent">
                    <div class="tab-pane fade show active online-read" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                      
                        <div class="recently-read">
                               <h1 class="mb-5 pb-3 pt-3 text-center">Online Library</h1>
                               
                                <div class="row">
                                    <div class="col-3  text-center mb-5 pb-5">
                                        <img class="recent-book" src="resources\pic\EastLondonOpinionated_front2.jpg" height="170px" alt="">
                                    </div>
                                    <div class="col-3  text-center mb-5 pb-5">
                                        <img class="recent-book" src="resources\pic\HarryPotter.jpg" height="170px" alt="">
                                    </div>
                                    <div class="col-3  text-center mb-5 pb-5">
                                        <img class="recent-book" src="resources\pic\Warcraft.jpg" height="170px" alt="">
                                    </div>
                                    <div class="col-3  text-center mb-5 pb-5">
                                            <img class="recent-book" src="resources\pic\HarryPotter.jpg" height="170px" alt="">
                                        </div>
                                      <div class="col-3  text-center mb-5 pb-5">
                                        <img class="recent-book" src="resources\pic\EastLondonOpinionated_front2.jpg" height="170px" alt="">
                                    </div>
                                    <div class="col-3  text-center mb-5 pb-5">
                                        <img class="recent-book" src="resources\pic\HarryPotter.jpg" height="170px" alt="">
                                    </div>
                                    <div class="col-3  text-center mb-5 pb-5">
                                        <img class="recent-book" src="resources\pic\Warcraft.jpg" height="170px" alt="">
                                    </div>
                                    <div class="col-3  text-center mb-5 pb-5">
                                            <img class="recent-book" src="resources\pic\HarryPotter.jpg" height="170px" alt="">
                                        </div>
                                        <div class="col-3  text-center mb-5 pb-5">
                                            <img class="recent-book" src="resources\pic\EastLondonOpinionated_front2.jpg" height="170px" alt="">
                                        </div>
                                        <div class="col-3  text-center mb-5 pb-5">
                                            <img class="recent-book" src="resources\pic\HarryPotter.jpg" height="170px" alt="">
                                        </div>
                                        <div class="col-3  text-center mb-5 pb-5">
                                            <img class="recent-book" src="resources\pic\Warcraft.jpg" height="170px" alt="">
                                        </div>
                                        <div class="col-3  text-center mb-5 pb-5">
                                                <img class="recent-book" src="resources\pic\HarryPotter.jpg" height="170px" alt="">
                                            </div>        
                                    
                                </div>
                        </div>
                        

                    </div>
                    <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                        <div class="row">
                      <div class="col-4 account-reserve-book p-3">
                        <div class="card-content-reserve p-2">
                            <img class=" text-center  pt-2 pb-2" src="resources\pic\EastLondonOpinionated_front2.jpg" height="170px" alt="">
                            <div class="text-card float-right pt-4">
                                    <h5>Name: East London</h5>
                                    <h5>Object: English</h5>
                            <p class="pt-4 mb-0 expired">Reserve time: 16.03.2018</p>
                            
                            <p class="mb-0 expired">Retern time: 16.03.2019</p>
                        </div>
                        </div>
                    </div>
                    <div class="col-4 account-reserve-book p-3">
                        <div class="card-content-reserve p-2">
                            <img class=" text-center  pt-2 pb-2" src="resources\pic\EastLondonOpinionated_front2.jpg" height="170px" alt="">
                            <div class="text-card float-right pt-4">
                                    <h5>Name: East London</h5>
                                    <h5>Object: English</h5>
                            <p class="pt-4 mb-0 soon">Reserve time: 16.03.2018</p>
                            
                            <p class="mb-0 soon">Retern time: 16.03.2019</p>
                        </div>
                        </div>
                    </div>
                    <div class="col-4 account-reserve-book p-3">
                            <div class="card-content-reserve p-2">
                                <img class=" text-center  pt-2 pb-2" src="resources\pic\EastLondonOpinionated_front2.jpg" height="170px" alt="">
                                <div class="text-card float-right pt-4">
                                        <h5>Name: East London</h5>
                                        <h5>Object: English</h5>
                                <p class="pt-4 mb-0">Reserve time: 16.03.2018</p>
                                
                                <p class="mb-0">Retern time: 16.03.2019</p>
                            </div>
                            </div>
                        </div>
                    </div>
                    </div>

                    <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                            <div class="row">
                        <div class="col-4 account-reserve-book p-3">
                          <div class="card-content-reserve p-2">
                              <img class=" text-center  pt-2 pb-2" src="resources\pic\EastLondonOpinionated_front2.jpg" height="170px" alt="">
                              <div class="text-card float-right pt-4">
                                      <h5>Name: East London</h5>
                                      <h5>Object: English</h5>
                              <p class="pt-4 mb-0 ">Status: Waiting for a response</p>
                              <svg viewBox="0 0 8 8"><use xlink:href="#question-mark"></use></svg>
                          </div>
                          </div>
                      </div>
                      <div class="col-4 account-reserve-book p-3">
                          <div class="card-content-reserve p-2">
                              <img class=" text-center  pt-2 pb-2" src="resources\pic\EastLondonOpinionated_front2.jpg" height="170px" alt="">
                              <div class="text-card float-right pt-4">
                                      <h5>Name: East London</h5>
                                      <h5>Object: English</h5>
                              <p class=" pt-4 mt-0 ">Status: Confirmed</p>
                              <svg viewBox="0 0 8 8"><use xlink:href="#check"></use></svg>

                          </div>
                          </div>
                      </div>
                      </div>
                    </div>
                
                  </div>
                </div>
    </section>
</div>
</div>
    <footer>

    </footer>
</body>
<script src="resources\JS\jquery-3.2.1.slim.min.js" async></script>
<script src="resources\JS\popper.min.js" async></script>
<script src="resources\JS\bootstrap.js" async></script>
</html>
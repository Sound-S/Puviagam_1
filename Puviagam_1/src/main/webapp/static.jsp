<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>puviagam</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

    <link rel="stylesheet" href="index.css">
    
    <link rel="icon"
	href="https://res.cloudinary.com/dsedsmqrs/image/upload/v1686139634/1686139290681_zzxygi.png">

</head>
<body class="bg-black"style="font-family:Verdana">

    <!--navbar start-->
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">

            <div class="container">
                   <div class="container">
				<a href="" class="navbar-brand"><img
					src="https://res.cloudinary.com/dsedsmqrs/image/upload/v1685905487/1685905387595_t6z2ge.png"
					class="img-fluid" alt="company logo"
					style="height: 40px; width: 180px;"> </a>
					</div>

                     <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#Mynavbar" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                      <span class="navbar-toggler-icon"></span>
                     </button>
 
            <div class="collapse navbar-collapse" id="Mynavbar">

                <ul class="navbar-nav ms-auto">
                   <li class="nav-item"> 
                    <a href="#" class="nav-link  text-white">Home</a>
                   </li>

                   <li class="nav-item">
                    <a href="#services" class="nav-link text-white">Services</a>
                   </li>

                   <li class="nav-item">
                    <a href="#aboutus" class="nav-link text-white">About</a>
                   </li>

                   <li class="nav-item">
                    <a href="#contact" class="nav-link text-white">Contact</a>
                   </li>

                   <li class="nav-item">
                    <a href="index.jsp" class="nav-link text-white">Login</a>
                   </li>
                </ul>

            </div>

           </div>
           
        </nav>
    </header>
    <!--end navbar -->

  
    
    <!-- Section two start -->
    <div id="carouselExampleAutoplaying" class="carousel slide " data-bs-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="https://images.pexels.com/photos/1216589/pexels-photo-1216589.jpeg" class="d-block w-100" alt="c1">
          </div>
          <div class="carousel-item">
            <img src="https://images.pexels.com/photos/1145434/pexels-photo-1145434.jpeg" class="d-block w-100" alt="c2">
          </div>
          <div class="carousel-item">
            <img src="https://images.pexels.com/photos/2219024/pexels-photo-2219024.jpeg" class="d-block w-100" alt="c3">
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
      <!-- end Section two -->

      <!--  Section three start -->
      <div class="container-fluid text-center" id="services">
        
        <div class="row">
          <div class="col-sm-8 box1">
            
            <p id="tagline" class="text-white"> A simple architecture, engineering and consulting 
            firm that believes in designing spaces where people and 
            businesses thrive.</p>

          </div>

          <div class="col-sm-4 box2">

            <h2 class="text-white">Our Capabilities</h2>

            <ul class="list-group">
            <li class="list-group text-white">Site Estimation</li>
              <li class="list-group text-white">Inventory Maintenance</li>
              <li class="list-group text-white">Payment Details</li>
              
            </ul>
          </div>
        </div>
      </div>
      <!--  Section three end -->

      <!--  Section four start -->
      <div class="container-fluid about_div" id="aboutus">

        <h2 id="about-heading" class="text-white" >About Us</h2>

        <p id="about_text" class="text-white">Puviagam is a unique architecture, engineering and 
          consulting firm that designs spaces where people and 
          businesses thrive. We work together – planners and designers, 
          architects and engineers, sustainability experts and technology 
          champions – to spark new possibilities for our clients and for each other.</p>

      </div>
     <!--  Section four end -->

     <!--  Section five start -->

        <!-- 
        <div class="container-fluid about_div">

        <h2 id="about-heading" class="text-white">Contact Us</h2>

        <p id="about_text" class="text-white">

          <address class="text-white" id="about-heading">
            Puviyagam, No:10, PT Rajan Rd, Sector 1, K. K. Nagar, Chennai, Tamil Nadu 600078.
          </address>

          <p class="text-white" id="about-heading">
            <b>Phone : +91 9874589652</b>

          </p>

          <p class="text-white" id="about-heading">
            <b>Email : Puviyagam@gmail.com</b>
          </p>


        </p>

      </div> 
       -->

      <!--  Section five end -->


      

        <div class="container text-center contact_div" id="contact">
          <div class="row">
            <div class="col inner_contact">

              <h2 id="about-heading" class="text-white">Contact Us</h2>
              <p id="about_text" class="text-white">

                <address class="text-white" id="about-heading">
                  Puviagam, No:10, PT Rajan Rd, Sector 1, K. K. Nagar, Chennai, Tamil Nadu 600078.
                </address>
      
                <p class="text-white" id="about-heading">
                  <b>Phone : +91 9874589652</b>
      
                </p>
      
                <p class="text-white" id="about-heading">
                  <b>Email : Puviagam@gmail.com</b>
                </p>
      
      
              </p>
            </div>
            <div class="col">
              <div class="container dis_back1 mb-4">
                <h4 class="text-white heading_enquiry">Enquiry Now</h4>
            <form>
              

               <!-- user name input -->
               <div class="form-outline mb-4 ">
                <input type="text" id="form2Example1" class="form-control" required/>
                <label class="form-label text-white" for="form2Example1">Name </label>
              </div>


                <!-- Email input -->
                <div class="form-outline mb-4">
                  <input type="email" id="form2Example2" class="form-control" required/>
                  <label class="form-label text-white" for="form2Example2">Email-Id</label>
                </div>
              
               <!-- mobile number  input -->
                <div class="form-outline mb-4">
                  <input type="number" id="form2Example3" class="form-control" required/>
                  <label class="form-label text-white" for="form2Example3">Mobile Number</label>
                </div>
              

                <!--text area  input -->
                <div class="form-outline mb-4">
                 <textarea  id="form2Example4" class="form-control" required> </textarea>
                  <label class="form-label text-white" for="form2Example4">Comments</label>
                </div>
              
              
              
                <!-- Submit button -->
                <button type="button" class="btn btn-primary btn-block mb-4 buttonw">Submit</button>
              
              </form>
            </div>
            </div>
            
          </div>
        </div>
       
      

      
            




          
        

      

        
      

    













    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>
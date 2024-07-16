<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Beauty Salon</title>
    <!-- CSS File -->
    <link rel="stylesheet" href="style1.css">
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<%


response.setHeader("Cache-Control","no-cache,no-store, must-revalidate");    
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");
%>


</head>
<body>	
    <header class="header" id="header">
        <div class="navbar">
            <div class="logo">
                <img src="img/logo.svg">
            </div>
            <nav class="nav-menu" id="nav-menu">
                <ul class="nav-list">
                    <li><a href="#" class="nav-link active">home</a></li>
                    <li><a href="about.jsp" class="nav-link">about</a></li>
                    <li><a href="newservice.jsp" class="nav-link">services</a></li>
                    <li><a href="#package" class="nav-link">package</a></li>
                    <li><a href="#gallery" class="nav-link">gallery</a></li>
                    <li><a href="displayproduct.jsp" class="nav-link">product</a></li>
                    <li><a href="#contact" class="nav-link">contact</a></li>
                
                    
                    
                    <% 
                   
                    if(session.getAttribute("user_id")== null)
                    {
                    	%>
                    	    <li><a href="reg.jsp" class="nav-link">Registration</a></li>
                        <li><a href="login.jsp" class="nav-link">login</a></li>
                    	<% 
                    }
                    else
                    {
                    	%>
                    	
                    	<li><a href="udash.jsp" class="nav-link">Dashboard</a></li>
                    	<li><a href="logout.jsp" class="nav-link">logout</a></li>
                    	
                    <% 
                    }
                    
                    
                    
                    %>
                    
                    
                    
                    
                </ul>
            </nav>
            <div class="nav-toggle" id="nav-toggle">
                <i class="fas fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Start Home Section -->
    <section class="home">
        <div class="container">
            <div class="home-img">
                <img src="img/home-img.png">
            </div>
            <div class="home-content">
                <h1>Your big day<br><span>in style</span></h1>
                <p>Come see our bride's corner and take the opportunity to schedule your date.</p>
                <a href="apooin.jsp" class="btn btn-outline">
                    <i class="fab fa-whatsapp"></i>
                    book appointment

                    
                </a>
            </div>
        </div>
    </section>
    <!-- End Home Section -->
    <!-- Start About Section -->
    <section class="about" id="about">
        <div class="container">
            <div class="section-title">
                <h1>our story</h1>
                <span>studio hair</span>
            </div>
            <div class="about-detail">
                <div class="about-detail-content">
                    <div class="about-img">
                        <img src="img/about-img.jpg">
                    </div>
                    <div class="about-description">
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.Velit possimus a sint</p>
                        <p>Obcaecati porro accusamus iusto rem aperiam. Lorem ipsum dolor sit amet consectetur adipisicing elit.
                        Velit possimus a sint</p>
                        <p>Eligendi nostrum architecto quibusdam. Neque odio enim quasi ad culpa similique quas.</p>
                        <button><a href="about.php" class="btn">Read More</a>
                            
                        </button>
                    </div>
                    
                </div>
            </div>
        </div>
    </section>
    <!-- End About Section -->
    <!-- Start Services Section -->
    <section class="services" id="services">
        <div class="services-content">
            <div class="section-title">
                <h1>services</h1>
                <span>what we do</span>
            </div>
            <div class="services-content-description">
                <div class="box">
                    <div class="inner">
                    <li><a href="services/services.php" class="nav-link"><img src="img/services/manicure.png" alt=""></a></li>
                       <!-- <a href="services/services.php"><img src="img/services/manicure.png" alt=""></a>  -->
                       <!-- <img src="img/services/manicure.png">                          -->
                        <p>manicure</p>
                    </div>
                </div>
                <div class="box">
                    <div class="inner">
                        <img src="img/services/pedicure.png">
                        <p>padicure</p>
                    </div>
                </div>
                <div class="box">
                    <div class="inner">
                        <img src="img/services/makeup.png">
                        <p>makeup</p>
                    </div>
                </div>
                <div class="box">
                    <div class="inner">
                        <img src="img/services/hairstyle.png">
                        <p>hairstyle</p>
                    </div>
                </div>
                <div class="box">
                    <div class="inner">
                        <img src="img/services/haircut.png">
                        <p>haircut</p>
                    </div>
                </div>
                <div class="box">
                    <div class="inner">
                        <img src="img/services/eyebrow design.png">
                        <p>eyebrow design</p>
                    </div>
                </div>
                <div class="box">
                    <div class="inner">
                        <img src="img/services/waxing.png">
                        <p>waxing</p>
                    </div>
                </div>
                <div class="box">
                    <div class="inner">
                        <img src="img/services/skin cleansing.png">
                        <p>skin cleansing</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Services Section -->
    <!-- Start Package Section -->
    <section class="package" id="package">
        <div class="section-title">
            <h1>promotional packages</h1>
            <span>for your bride's day</span>
        </div>
        <!-- <div class="package-cards">
            <div class="card">
                <div class="card-title">
                    <h1>Bronze</h1>
                </div>
                <div class="card-items">
                    <div class="item">
                        <i class="far fa-check-square check-icon"></i>
                        <p>Hairstyle</p>
                    </div>
                    <div class="item">
                        <i class="far fa-check-square check-icon"></i>
                        <p>makeup</p>
                    </div>
                    <div class="item">
                        <i class="far fa-check-square check-icon"></i>
                        <p>nails</p>
                    </div>
                    <div class="item">
                        <i class="far fa-times-square x-icon"></i>
                        <p class="not">hair removal</span></p>
                    </div>
                    <div class="item">
                        <i class="far fa-times-square x-icon"></i>
                        <p class="not">eyebrow design</span></p>
                    </div>
                    <div class="item">
                        <i class="far fa-times-square x-icon"></i>
                        <p class="not">skin cleansing</span></p>
                    </div>
                    <div class="item">
                        <i class="far fa-times-square x-icon"></i>
                        <p class="not">reserved bridal room</span></p>
                    </div>
                    <div class="item">
                        <i class="far fa-times-square x-icon"></i>
                        <p class="not">table fruit</span></p>
                    </div>
                   <a href="bronze.php"> <button class="btn">I want this</button></a>
                </div>             
            </div> -->
            <div class="card">
                <div class="card-title">
                    <h1>Package</h1>
                </div>
                <div class="card-items">
                    <div class="item">
                        <i class="far fa-check-square check-icon"></i>
                        <p>Hairstyle</p>
                    </div>
                    <div class="item">
                        <i class="far fa-check-square check-icon"></i>
                        <p>makeup</p>
                    </div>
                    <div class="item">
                        <i class="far fa-check-square check-icon"></i>
                        <p>nails</p>
                    </div>
                    <div class="item">
                        <i class="far fa-check-square check-icon"></i>
                        <p>hair removal</span></p>
                    </div>
                    <div class="item">
                        <i class="far fa-check-square check-icon"></i>
                        <p>eyebrow design</span></p>
                    </div>
                    <div class="item">
                        <i class="far fa-check-square check-icon"></i>
                        <p>skin cleansing</span></p>
                    </div>
                    <div class="item">
                        <i class="far fa-times-square x-icon"></i>
                        <p class="not">reserved bridal room</span></p>
                    </div>
                    <div class="item">
                        <i class="far fa-times-square x-icon"></i>
                        <p class="not">table fruit</span></p>
                    </div>
                    <a href="displaypack.jsp"> <button class="btn">I want this</button></a>
                </div>             
            </div>
           <!--  <div class="card">
                <div class="card-title">
                    <h1>Gold</h1>
                </div>
                <div class="card-items">
                    <div class="item">
                        <i class="far fa-check-square check-icon"></i>
                        <p>Hairstyle</p>
                    </div>
                    <div class="item">
                        <i class="far fa-check-square check-icon"></i>
                        <p>makeup</p>
                    </div>
                    <div class="item">
                        <i class="far fa-check-square check-icon"></i>
                        <p>nails</p>
                    </div>
                    <div class="item">
                        <i class="far fa-check-square check-icon"></i>
                        <p>hair removal</span></p>
                    </div>
                    <div class="item">
                        <i class="far fa-check-square check-icon"></i>
                        <p>eyebrow design</span></p>
                    </div>
                    <div class="item">
                        <i class="far fa-times-square x-icon"></i>
                        <p class="not">skin cleansing</span></p>
                    </div>
                    <div class="item">
                        <i class="far fa-check-square check-icon"></i>
                        <p>reserved bridal room</span></p>
                    </div>
                    <div class="item">
                        <i class="far fa-times-square x-icon"></i>
                        <p class="not">table fruit</span></p>
                    </div>
                    <a href="gold.php"> <button class="btn">I want this</button></a>
                </div>             
            </div>
            <div class="card">
                <div class="card-title">
                    <h1>Diamond</h1>
                </div>
                <div class="card-items">
                    <div class="item">
                        <i class="far fa-check-square check-icon"></i>
                        <p>Hairstyle</p>
                    </div>
                    <div class="item">
                        <i class="far fa-check-square check-icon"></i>
                        <p>makeup</p>
                    </div>
                    <div class="item">
                        <i class="far fa-check-square check-icon"></i>
                        <p>nails</p>
                    </div>
                    <div class="item">
                        <i class="far fa-check-square check-icon"></i>
                        <p>hair removal</span></p>
                    </div>
                    <div class="item">
                        <i class="far fa-check-square check-icon"></i>
                        <p>eyebrow design</span></p>
                    </div>
                    <div class="item">
                        <i class="far fa-check-square check-icon"></i>
                        <p>skin cleansing</span></p>
                    </div>
                    <div class="item">
                        <i class="far fa-check-square check-icon"></i>
                        <p>reserved bridal room</span></p>
                    </div>
                    <div class="item">
                        <i class="far fa-check-square check-icon"></i>
                        <p>table fruit</span></p>
                    </div>
                    <a href="diamond.php"> <button class="btn">I want this</button></a>
                </div> -->            
            </div> 
        </div>
    </section>
    <!-- End Package Section -->
    <!-- Start Gallery Section -->
     <!-- Start Gallery Section -->
    <section class="gallery" id="gallery"> 
        <br>
        <div class="section-title">
            <h1>gallery</h1>
            <span>the princesses of our instagram</span>
        </div>
        <br>
        <section class="gallery-slider">
             <div class="slide"></div>
        </section>
    </section>
    <br>
    
    <!-- End Gallery Section -->

    <!-- Start Testimonials Section -->
    <section class="testimonials">
        <div class="testimonials-content">
            <div class="section-title">
                <h1>testimonials</h1>
                <span>see what our customer say</span>
            </div>
            <div class="testimonials-card">
                <div class="testimonials-item">
                    <div class="testimonials-img">
                        <img src="img/testimonials/testimonials1.png">
                    </div>
                    <div class="testimonials-box">
                        <div class="testimonials-name">
                            <h1>Bhumi</h1>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                        <div class="testimonials-description">
                            <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolor earum culpa eius, libero reprehenderit maiores.</p>
                        </div>
                    </div>
                </div>
                <div class="testimonials-item">
                    <div class="testimonials-img">
                        <img src="img/testimonials/testimonials2.png">
                    </div>
                    <div class="testimonials-box">
                        <div class="testimonials-name">
                            <h1>Anvi</h1>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                        <div class="testimonials-description">
                            <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolor earum culpa eius, libero reprehenderit maiores.</p>
                        </div>
                    </div>
                </div>
                <div class="testimonials-item">
                    <div class="testimonials-img">
                        <img src="img/testimonials/testimonials1.png">
                    </div>
                    <div class="testimonials-box">
                        <div class="testimonials-name">
                            <h1>Nidhi</h1>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                        <div class="testimonials-description">
                            <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolor earum culpa eius, libero reprehenderit maiores.</p>
                        </div>
                    </div>
                </div>
                <div class="testimonials-item">
                    <div class="testimonials-img">
                        <img src="img/testimonials/testimonials2.png">
                    </div>
                    <div class="testimonials-box">
                        <div class="testimonials-name">
                            <h1>Ritul</h1>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                        <div class="testimonials-description">
                            <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolor earum culpa eius, libero reprehenderit maiores.</p>
                        </div>
                    </div>
                    
                </div>
                
            </div>
            
        </div>
        <center>
        <button><a href="feedback.jsp" class="feedback">Feedback</a></button>
        </center>
    </section>

    <!-- End Testimonials Section -->
    <!-- Start Footer Section -->
    <footer class="footer" id="contact">
        <div class="footer-list">
            <div class="footer-data">
                <h1><a href=""><img src="img/logo.svg"></a></h1>
                <div class="footer-data-social">
                    <a href=""><i class="fab fa-facebook"></i></a>
                    <a href=""><i class="fab fa-instagram"></i></a>
                    <a href=""><i class="fab fa-twitter"></i></a>
                </div>
            </div>
            <div class="footer-data">
                <h2>address</h2>
                <p>Alharm - St 26<br> Giza - Egypt</p>
            </div>
            <div class="footer-data">
                <h2>We Opened</h2>
                <p>Monday To Friday <br> From 09:00 To 18:00</p>
            </div>
            <div class="footer-data">
                <h2>Contact</h2>
                <p>(20) 1111-222-333</p>
                <p>(20) 4444-555-666</p>
            </div>
        </div>
        <div class="copy">
            <p>&copy; All Rights Reserved</p>
            <span>Created by 🤎 Web Trend</span>
        </div>
    </footer>
    <!-- End Footer Section -->
    <!-- Javascript File -->
    <script src="main.js"></script>
</body>
</html>
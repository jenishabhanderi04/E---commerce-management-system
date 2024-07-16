<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>

   <style>

   </style>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>admin panel</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

   <!-- custom css file link  -->
   <!-- <link rel="stylesheet" href="prostyle.css"> -->
   <link rel="stylesheet" href="addprostyle.css">

</head>
<body>
   


<!-- <div class="container"> -->

<section>

            <div class="M">
                <div class="F">
                    <!--  <section class="gallery-slider">
        <div class="slide">
         </div>
    </section> -->

                  <!--   <img src="b1.jpg" class="I">  -->
                </div>
 <div class="L">
<div class="l-form">
<form action="ADDpack" method="post" class="form" enctype="multipart/form-data">
   <h3 class="form__title">Add New Product</h3>

    <div class="form__div">
   <input type="text" name="p_name" placeholder="" class="form__input" required>
   <label for="" class="form__label" >Name</label>
</div>

 <div class="form__div">
   <input type="text" name="ser" min="0" placeholder="" class="form__input" required>
   <label for="" class="form__label" >Service</label>
</div>

  <div class="form__div">
   <input type="number" name="p_price" min="0" placeholder="" class="form__input" required>
   <label for="" class="form__label" >Price</label>
</div>

   <div class="form__div">
   <input type="file" name="image" accept="image/png, image/jpg, image/jpeg" class="form__input"required>
   <label for="" class="form__label" >File</label>
</div>


   <input type="submit" value="add the package" name="add_product" class="form__button">
   <a href="managepackage.jsp"  class="back_button">Back</a>
</form>
</div>

</div>
</div>
</div>

</section>
<script src="book.js"></script>

</body>
</html>
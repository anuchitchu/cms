<?php

require '../includes/init.php';

Auth::requireLogin();

$conn = require '../includes/db.php';

if (isset($_GET['id'])) {

    $article = Article::getByID($conn,$_GET['id']);
    
    if( ! $article){
        die("article not found");
    }
} else {
    die("id not supplied, article not found");
}

if($_SERVER["REQUEST_METHOD"] == "POST"){
    //var_dump($_FILES);
    
    $previous_image = $article->image_file;
    if ($article->setImageFile($conn, null)) {
        if ($previous_image) {
            unlink("../uploads/$previous_image");
        }
        Url::redirect("/cms/admin/edit-article-image.php?id={$article->id}");
    }    
       
}

?>

<?php require '../includes/header.php';?>

<h2>Delete article image</h2>
    <?php if ($article->image_file) : ?>
        <img src="<?=Url::currentURL();?>/cms/uploads/<?= $article->image_file; ?>">
    <?php endif; ?>
<form method="post" >
        <P>Are you sure</P>
        <button>Delete</button>
    <a href="<?=Url::currentURL();?>/cms/admin/edit-article-image.php?id=<?= $article->id; ?>">Cancel</a>
</form>

<?php require '../includes/footer.php'; ?>
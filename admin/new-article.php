<?php

require '../includes/init.php';

Auth::requireLogin();

$article = new Article();

$category_ids = [];

$conn = require '../includes/db.php';

$categories = Category::getAll($conn);
//var_dump($categories);


if($_SERVER["REQUEST_METHOD"] == "POST"){
    
    $article->title = $_POST['title'];
    $article->content = $_POST['content'];
    $article->published_at = $_POST['published_at'];

    $category_ids = (empty($_POST['category'])) ? [] : $_POST['category'];

    if($article->create($conn)){
        $article->setCategories($conn,$category_ids);
        Url::redirect("/cms/admin/article.php?id={$article->id}");
    }
}
?>


<?php require '../includes/header.php';?>

<h2>New article</h2>

<?php require 'includes/article-form.php'; ?>

<?php require '../includes/footer.php'; ?>
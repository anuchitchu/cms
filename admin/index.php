<?php

require '../includes/init.php';

Auth::requireLogin();

$conn = require '../includes/db.php';

// if(isset($_GET['page'])){
//     $paginator = new Paginator($_GET['page'],4);
// }else{
//     $paginator = new Paginator(1,4);
// }

//Ternary Operator
$paginator = new Paginator(  isset($_GET['page'])?$_GET['page']:1  ,4,Article::getTotal($conn));

//
//Null coalescing operator (php 7)
//$paginator = new Paginator( $_GET['page'] ?? 1  ,4);

$articles = Article::getPage($conn,$paginator->limit,$paginator->offset);

//echo Url::currentURL();

?>

<?php require '../includes/header.php'; ?>
<?php //var_dump($_SESSION); ?>

<h2>Administration</h2>

<a href="/cms/admin/new-article.php">New article</a>
     
        <?php if (empty($articles)): ?>
            <p>No articles found.</p>
        <?php else: ?>

            <table>
                <thead>
                    <th>Title</th>
                    <th>Published</th>
                </thead>
                <tbody>
                    <?php foreach ($articles as $article): ?>
                        <tr>
                            <td>
                                <a href="./article.php?id=<?=$article['id']?>"><?= 
                                htmlspecialchars($article['title']); ?></a>
                            </td>
                            <td>
                                <?php if ($article['published_at']) : ?>
                                    <time><?= $article['published_at'] ?></time>
                                <?php else : ?>
                                    Unpublished
                                    <button class="publish" data-id="<?= $article['id'] ?>">Publish</button>
                                <?php endif; ?>
                            </td>
                         </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>

            <?php require '../includes/pagination.php';?>
            
        <?php endif; ?>

<?php require '../includes/footer.php'; ?>

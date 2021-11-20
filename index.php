<?php

require 'includes/init.php';

$conn = require 'includes/db.php';

// if(isset($_GET['page'])){
//     $paginator = new Paginator($_GET['page'],4);
// }else{
//     $paginator = new Paginator(1,4);
// }

//Ternary Operator
$paginator = new Paginator(  isset($_GET['page'])?$_GET['page']:1  ,4,Article::getTotal($conn,true));

//
//Null coalescing operator (php 7)
//$paginator = new Paginator( $_GET['page'] ?? 1  ,4);


$articles = Article::getPage($conn,$paginator->limit,$paginator->offset,true);

?>

<?php require 'includes/header.php'; ?>
<?php //var_dump($_SESSION); ?>

        <?php if (empty($articles)): ?>
            <p>No articles found.</p>
        <?php else: ?>

            <ul>
                <?php foreach ($articles as $article): ?>
                    <li>
                        <article>
                            
                            <h2><a href="./article.php?id=<?=$article['id']?>"><?= 
                            htmlspecialchars($article['title']); ?></a></h2>

                            <time datetime="<?= $article['published_at'] ?>"><?php
                                $datetime = new DateTime($article['published_at']);
                                echo $datetime->format("j F, Y");
                            ?></time>

                            <p>Categories:
                            <?php if($article['category_names']): ?> 
                                <?php foreach ( $article['category_names'] as $name ) : ?>
                                    <?=htmlspecialchars($name); ?>
                                <?php endforeach; ?>
                            <?php endif; ?>
                            </p>
                            <p><?= htmlspecialchars($article['content']); ?></p>
                        </article>
                    </li>
                <?php endforeach; ?>
            </ul>

            <?php require 'includes/pagination.php';?>

        <?php endif; ?>

<?php require 'includes/footer.php'; ?>

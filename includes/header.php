<!DOCTYPE html>
<html>
<head>
    <title>My blog</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="<?=Url::currentURL();?>/cms/css/jquery.datetimepicker.min.css">
</head>
<body>

    <header>
        <h1>My blog</h1>
    </header>

    <nav>
        <ul>
            <li><a href="<?=Url::currentURL();?>/cms/index.php">Home</a></li>
            <?php if (Auth::isLoggedin()):?>
                <li><a href="<?=Url::currentURL();?>/cms/admin/index.php">Admin</a></li>
                <li><a href="<?=Url::currentURL();?>/cms/logout.php">Log out</a></li>
            <?PHP else: ?> 
                <li><a href="<?=Url::currentURL();?>/cms/login.php">Log in</a></li>
            <?PHP endif;?> 
        </ul>
    </nav>

    <main>
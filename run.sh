mkdir -p thumbnail

cat << ! > index.html
    <head>
    <link href="notosc/noto_serif_sc_bold/css.css" rel="stylesheet">
    <link href="notosc/noto_serif_sc_regular/css.css" rel="stylesheet">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>图片预览下载</title>
    </head>

    <style>
        .imgshow{
            max-width: 400px;
            margin: 10px;
        }
        img{
            max-width: 100%;
            max-height: 100%;
        }
        .container {
            display: flex;
            flex-wrap: wrap;
        }
    </style>

    <body>
    <div class='container'>
!

for i in $(ls|grep JPG); do
    echo $i
    raw=$(echo $i|sed "s/JPG/CR3/g")
    echo $raw
    # jpegoptim -d thumbnail/$i  $i
    convert -resize 1024x1024 -quality 75 $i thumbnail/$i

    echo "<div class='imgshow'><img src='thumbnail/$i' /><a href='$i'>原图</a> <a href='$raw'>底片</a></div> " >> index.html
done

echo "</div></body>" >> index.html



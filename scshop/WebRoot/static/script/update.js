
document.querySelector('input').addEventListener('change', function () {
    var that = this;

    lrz(that.files[0], {
        width: 800
    })
    .then(function (rst) {
        var img = document.getElementById('headimg');            
            sourceSize = toFixed2(that.files[0].size / 1024),
            resultSize = toFixed2(rst.fileLen / 1024),
            scale = parseInt(100 - (resultSize / sourceSize * 100));

        //div.className = 'col-sm-6';
        //that.parentNode.appendChild(img);

        img.src = rst.base64;

        // 原生ajax上传代码，所以看起来特别多 ╮(╯_╰)╭，但绝对能用
        // 其他框架，例如ajax处理formData略有不同，请自行google，baidu。
        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'update.php');

        xhr.onload = function (data) {
            if (xhr.status === 200) {
                console.log(data);
            // 上传成功
            } else {
                alert("上传成功22222")
            // 处理其他情况
            }
        };

        xhr.onerror = function () {
            alert("程序错误")
            // 处理错误
        };

         // issues #45 提到似乎有兼容性问题,关于progress
        xhr.upload.onprogress = function (e) {
            // 上传进度
            var percentComplete = ((e.loaded / e.total) || 0) * 100;
        };

        // 添加参数和触发上传
        rst.formData.append('a', 'img');
        xhr.send(rst.formData);
        return rst;
    });
});

function toFixed2 (num) {
    return parseFloat(+num.toFixed(2));
}

/**
 *
 * 　　　┏┓　　　┏┓
 * 　　┏┛┻━━━┛┻┓
 * 　　┃　　　　　　　┃
 * 　　┃　　　━　　　┃
 * 　　┃　┳┛　┗┳　┃
 * 　　┃　　　　　　　┃
 * 　　┃　　　┻　　　┃
 * 　　┃　　　　　　　┃
 * 　　┗━┓　　　┏━┛Code is far away from bug with the animal protecting
 * 　　　　┃　　　┃    神兽保佑,代码无bug
 * 　　　　┃　　　┃
 * 　　　　┃　　　┗━━━┓
 * 　　　　┃　　　　　 ┣┓
 * 　　　　┃　　　　 ┏┛
 * 　　　　┗┓┓┏━┳┓┏┛
 * 　　　　　┃┫┫　┃┫┫
 * 　　　　　┗┻┛　┗┻┛
 *
 */

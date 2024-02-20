// 画像投稿時のプレビュー機能（plamo）
if (document.URL.match(/post_plamos\/new/) || document.URL.match(/post_plamos\/edit/)){
  document.addEventListener('DOMContentLoaded', () => {
    const ImageList = document.getElementById('new-plamo-images');
    const imageElement = document.getElementById('new-plamo-image-files');
    const createImageHTML = (blob) => {
      const blobImage = document.createElement('img');
      blobImage.setAttribute('class', 'new-img')
      blobImage.setAttribute('src', blob);
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    };
    document.getElementById('post_plamo_plamo_images').addEventListener('change', (e) =>{
      imageElement.innerHTML ="";
      for ( var i = 0; i < e.target.files.length; i++ ){
        var file = e.target.files[i];
        const blob = window.URL.createObjectURL(file);
        createImageHTML(blob);
      }
    });
  });
}
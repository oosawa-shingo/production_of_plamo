// 画像投稿時のプレビュー機能（review）
if (document.URL.match(/post_reviews\/new/) || document.URL.match(/post_reviews\/edit/)){
  document.addEventListener('DOMContentLoaded', () => {
    const ImageList = document.getElementById('new-review-images');
    const imageElement = document.getElementById('new-review-image-files');
    const createImageHTML = (blob) => {
      const blobImage = document.createElement('img');
      blobImage.setAttribute('class', 'new-img')
      blobImage.setAttribute('src', blob);
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    };
    document.getElementById('post_review_review_images').addEventListener('change', (e) =>{
      imageElement.innerHTML ="";
      for ( var i = 0; i < e.target.files.length; i++ ){
        var file = e.target.files[i];
        const blob = window.URL.createObjectURL(file);
        createImageHTML(blob);
      }
    });
  });
}
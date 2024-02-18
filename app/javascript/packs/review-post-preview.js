// 画像投稿時のプレビュー機能（review）
if (document.URL.match(/post_reviews\/new/) || document.URL.match(/post_reviews\/edit/)){
  document.addEventListener('DOMContentLoaded', () => {
    const ImageList = document.getElementById('new-review-images');
    const createImageHTML = (blob) => {
      const imageElement = document.getElementById('new-review-image-files');
      const blobImage = document.createElement('img');
      blobImage.setAttribute('class', 'new-img')
      blobImage.setAttribute('src', blob);
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    };
    document.getElementById('post_review_review_images').addEventListener('change', (e) =>{
      const imageContent = document.querySelector('img');
      if (imageContent){
        imageContent.remove();
      }
      const file1 = e.target.files[0];
      const blob1 = window.URL.createObjectURL(file1);
      createImageHTML(blob1);
      const file2 = e.target.files[1];
      const blob2 = window.URL.createObjectURL(file2);
      createImageHTML(blob2);
      const file3 = e.target.files[2];
      const blob3 = window.URL.createObjectURL(file3);
      createImageHTML(blob3);
      const file4 = e.target.files[3];
      const blob4 = window.URL.createObjectURL(file4);
      createImageHTML(blob4);
      const file5 = e.target.files[4];
      const blob5 = window.URL.createObjectURL(file5);
      createImageHTML(blob5);
    });
  });
}
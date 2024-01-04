// 画像投稿時のプレビュー機能（plamo）
if (document.URL.match(/new/) || document.URL.match(/edit/)){
  document.addEventListener('DOMContentLoaded', () => {
    const ImageList = document.getElementById('new-plamo-images');
    const createImageHTML = (blob) => {
      const imageElement = document.getElementById('new-plamo-image-files');
      const blobImage = document.createElement('img');
      blobImage.setAttribute('class', 'new-img')
      blobImage.setAttribute('src', blob);
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    };
    document.getElementById('post_plamo_plamo_images').addEventListener('change', (e) =>{
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
      const file6 = e.target.files[5];
      const blob6 = window.URL.createObjectURL(file6);
      createImageHTML(blob6);
      const file7 = e.target.files[6];
      const blob7 = window.URL.createObjectURL(file7);
      createImageHTML(blob7);
      const file8 = e.target.files[7];
      const blob8 = window.URL.createObjectURL(file8);
      createImageHTML(blob8);
    });
  });
}

// 画像投稿時のプレビュー機能（review）
if (document.URL.match(/new/) || document.URL.match(/edit/)){
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
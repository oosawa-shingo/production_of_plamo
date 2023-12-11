// if (document.URL.match(/new/)){
//   document.addEventListener('DOMContentLoaded', () => {
//     const createImageHTML = (blob) => {
//       const imageElement = document.getElementById('new-image');
//       const blobImage = document.createElement('img');
//       blobImage.setAttribute('class', 'new-img')
//       blobImage.setAttribute('src', blob);

//       imageElement.appendChild(blobImage);
//     };

//     document.getElementById('post_palmo_plamo_images').addEventListener('change', (e) =>{
//       const file = e.target.files[0];
//       const blob = window.URL.createObjectURL(file);
//       createImageHTML(blob);
//     });
//   });
// }
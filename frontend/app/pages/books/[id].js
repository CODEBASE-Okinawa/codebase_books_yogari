// import React, { useEffect, useState } from 'react';
// import axios from 'axios';
// import { useRouter } from 'next/router';

// const BookDetail = () => {
//   const router = useRouter();
//   const { id } = router.query;
//   const [book, setBook] = useState(null);

//   useEffect(() => {
//     const fetchData = async () => {
//       try {
//         const response = await axios.get(`http://localhost:3000/books/${id}`);
//         setBook(response.data);
//       } catch (error) {
//         console.error('Error fetching data:', error);
//       }
//     };

//     if (id) {
//       fetchData();
//     }
//   }, [id]);

//   if (!book) {
//     return <div>Loading...</div>;
//   }

//   return (
//     <div>
//       <h1>{book.title}</h1>
//       <p>Author: {book.author}</p>
//       {/* 他の詳細情報も表示できるように適宜追加 */}
//       <button> 貸し出し</button>
//       <button> 予約</button>
//     </div>
//   );
// };

// export default BookDetail;

import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { useRouter } from 'next/router';

const BookDetail = () => {
  const router = useRouter();
  const { id } = router.query;
  const [book, setBook] = useState(null);
  const [lendingDate, setLendingDate] = useState(getTodayDateString());
  const [isLoading, setIsLoading] = useState(false);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await axios.get(`http://localhost:3000/books/${id}`);
        setBook(response.data);
      } catch (error) {
        console.error('Error fetching data:', error);
      }
    };

    if (id) {
      fetchData();
    }
  }, [id]);

  const handleLendBook = async () => {
    if (lendingDate) {
      try {
        setIsLoading(true);
        await axios.post('http://localhost:3000/lending', {
          bookId: id,
          lendingDate: lendingDate,
        });
        console.log('Book lent successfully!');
      } catch (error) {
        console.error('Error lending book:', error);
      } finally {
        setIsLoading(false);
      }
    } else {
      console.error('Please enter a valid lending date.');
    }
  };

  if (!book) {
    return <div>Loading...</div>;
  }

  return (
    <div>
      <h1>{book.title}</h1>
      <p>Author: {book.author}</p>
      <p>Genre: {book.genre}</p>
      <p>Published Year: {book.publishedYear}</p>

      {/* 日付を入力するラベル */}
      <label>
        Lending Date:
        <input
          type="date"
          value={lendingDate}
          onChange={(e) => setLendingDate(e.target.value)}
        />
      </label>

      {/* 貸し出しボタン */}
      <button onClick={handleLendBook} disabled={isLoading}>
        {isLoading ? 'Lending...' : 'Lend'}
      </button>
    </div>
  );
};

// 今日の日付を取得するヘルパー関数
const getTodayDateString = () => {
  const today = new Date();
  const year = today.getFullYear();
  const month = String(today.getMonth() + 1).padStart(2, '0');
  const day = String(today.getDate()).padStart(2, '0');
  return `${year}-${month}-${day}`;
};

export default BookDetail;

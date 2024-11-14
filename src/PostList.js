import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';

function PostList() {
    const [posts, setPosts] = useState([]);

    useEffect(() => {
        axios.get('http://localhost:5000/api/posts').then((response) => {
            setPosts(response.data);
            console.log(response.data);
        });
    }, []);

    return (
        <div>
            <h1>My Blog</h1>
            {posts.map((post) => (
                <div key={post.id}>
                    <h2>
                        <Link to={`/posts/${post.id}`}>{post.title}</Link>
                    </h2>
                </div>
            ))}
        </div>
    );
}

export default PostList;
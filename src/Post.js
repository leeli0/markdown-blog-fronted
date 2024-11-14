import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { useParams } from 'react-router-dom';

function Post() {
    const { id } = useParams();
    const [postContent, setPostContent] = useState('');

    useEffect(() => {
        axios.get(`http://localhost:5000/api/posts/${id}`).then((response) => {
            setPostContent(response.data.content);
        });
    }, [id]);

    return (
        <div>
            <div dangerouslySetInnerHTML={{ __html: postContent }} />
        </div>
    )
}

export default Post;
# CLEAR TABLES

Comment.delete_all
ForumThread.delete_all
User.delete_all
ActiveRecord::Base.connection_pool.with_connection do |conn|
    conn.execute("TRUNCATE comments RESTART IDENTITY")
    conn.execute("TRUNCATE forum_threads RESTART IDENTITY")
    conn.execute("TRUNCATE users RESTART IDENTITY")
end


# SAMPLE DATA

User.create([
    {
        username: "admin",
        email: "admin@gmail.com",
        password: "$2a$10$yRC0ky6bCAKALscqn72z7uONyFb5a9uWU5OVIZsWcq8WKbwYKm8iy", #Password: AdminLogin1234
        bio: "Admin at your service!"
    },
    {
        username: "user1",
        email: "user1@gmail.com",
        password: "$2a$10$FXHcLM7tufUWhxMZylxjZ.J43QbEeFEoBs.KSHr1I18SGWSkXkG7K", #Password: Test1234
        bio: "I'm a completely ordinary user! Nothing to see here, move along"
    },
    {
        username: "user2",
        email: "user2@gmail.com",
        password: "$2a$10$FXHcLM7tufUWhxMZylxjZ.J43QbEeFEoBs.KSHr1I18SGWSkXkG7K", #Password: Test1234
        bio: "I hear user3 hasn't added a bio yet. What a loser!"
    },
    {
        username: "user3",
        email: "user3@gmail.com",
        password: "$2a$10$FXHcLM7tufUWhxMZylxjZ.J43QbEeFEoBs.KSHr1I18SGWSkXkG7K" #Password: Test1234
    }
]);

ForumThread.create([
    {
        title: "This is a thread by an admin",
        description: "<p><strong>This text is bold</strong></p><p><em>This text is italicised</em></p><p><s><u>This text is struck-through and underlined</u></s></p><ol><li>This is the first point of an ordered list</li><li>This is the second point.</li></ol><p><br></p><ul><li>This is a bulleted list</li><li>It has no particular order</li></ul><p><br></p><p><br>", #This is a test description
        tag: "tag 1",
        User_id: 1
    }]);

    ForumThread.create([
    {
        title: "Thread 2",
        description: "<p>This is a test description</p><p><strong>This is a test description</strong></p><p>This is a test description</p><p><s>This is a test description</s></p><p>This is a test description</p>",
        tag: "tag 1",
        User_id: 2
    },
    {
        title: "Thread 3",
        description: "<p>This is a test description</p><p><strong>This is a test description</strong></p><p>This is a test description</p><p><s>This is a test description</s></p><p>This is a test description</p>",
        tag: "tag 2",
        User_id: 3
    },
    {
        title: "Thread 4",
        description: "<p>This is a test description</p><p><strong>This is a test description</strong></p><p>This is a test description</p><p><s>This is a test description</s></p><p>This is a test description</p>",
        tag: "tag 3",
        User_id: 2
    },
    {
        title: "Thread 5",
        description: "<p>This is a test description</p><p><strong>This is a test description</strong></p><p>This is a test description</p><p><s>This is a test description</s></p><p>This is a test description</p>",
        tag: "tag 3",
        User_id: 3
    }
]);

Comment.create([
    {
        content: "This is a test comment by an admin. Notice the gold border as well as the badge.",
        forumthread_id: 1,
        User_id: 1
    },
    {
        content: "<p class=\"ql-align-center\"><em>Comments </em>have <span style=\"color: rgb(255, 255, 0);\">rich </span>text <u>formatting </u>and <span style=\"color: rgb(61, 20, 102); background-color: rgb(250, 204, 204);\">images </span><span class=\"ql-size-huge\">too</span><span class=\"ql-size-huge\" style=\"background-color: rgb(102, 185, 102);\">!</span></p>",
        forumthread_id: 2,
        User_id: 2
    },
    {
        content: "<p>This is a comment by another user.</p>",
        forumthread_id: 3,
        User_id: 3
    }]);
    Comment.create([
    {
        content: "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>",
        forumthread_id: 3,
        User_id: 4
    },
    {
        content: "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>",
        forumthread_id: 3,
        User_id: 3
    },
    {
        content: "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>",
        forumthread_id: 2,
        User_id: 1
    },
    {
        content: "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>",
        forumthread_id: 2,
        User_id: 2
    }
]);

let users = [
  {
    username: '山田',
    permissions: {
      canRead: true,
      canWrite: true,
      canDelete: false
    }
  },
  {
    username: '佐藤',
    permissions: {
      canRead: false,
      canWrite: true,
      canDelete: false
    }
  },
  // 追加のユーザーオブジェクト
];

function checkPermission(username, permission) {
  for (let i = 0; i < users.length; i++) {
    const user = users[i];
    if (user.username === username && user.permissions[permission]) {
      return true;
    }
  }
  return false;
}

console.log(checkPermission('山田', 'canWrite')); // true
console.log(checkPermission('佐藤', 'canRead')); // false
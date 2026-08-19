class TreeNode:
    def __init__(self, data, left=None, right=None):
        self.data = data
        self.left = left
        self.right = right

    def __str__(self):
        return f'TreeNode(data={self.data}, left={self.left}, right={self.right})'

def insert(node, data):
    if node is None:
        return TreeNode(data, None, None)
    elif data <= node.data:
        node.left=insert(node.left, data)
    else:
        node.right=insert(node.right, data)
    return node

def inorder(root, li):
    if root:
        inorder(root.left, li)
        print(root.data, end=" ")
        li.append(root.data)
        inorder(root.right, li)

class BinarySearchTree:
    def __init__(self, tree_data):
        self.root = None
        node = None
        for data in tree_data:
            node = insert(node, data)
            if self.root is None:
                self.root = node

    def data(self):
        return self.root

    def sorted_data(self):
        li =[]
        inorder(self.root, li)
        return li  

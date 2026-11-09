# MeTTa Practice: DFS, BFS, and BST Checker

## 1. Overview

This task implements two graph traversal algorithms (DFS and BFS) and a Binary Search Tree (BST) checker using MeTTa. It also introduces helper functions for list manipulation, recursion, and pattern matching.

## 2. List Helper Functions

Three helper functions are implemented:

- **`in-list`** – Checks whether an element exists in a list.
- **`list-add`** – Adds an element to the end of a list.
- **`list-join`** – Combines two lists into one.

These functions support the implementation of DFS and BFS.

## 3. Graph Representation

The graph is represented using directed edges:

```metta
(edge A B)
(edge A C)
(edge B D)
(edge B E)
(edge C H)
(edge C I)
(edge E F)
(edge E G)
(edge I J)
```

The `next-nodes` function retrieves all directly connected neighbors of a given node.

## 4. Depth-First Search (DFS)

**DFS** is a graph traversal algorithm that explores one branch as deeply as possible before returning to explore other branches.

The implementation uses recursion and a visited list to track explored nodes and avoid revisiting them.

## 5. Breadth-First Search (BFS)

**BFS** is a graph traversal algorithm that explores nodes level by level, visiting all immediate neighbors before moving to the next level.

The implementation uses a queue (FIFO: First In, First Out) to manage the order of exploration and a visited list to avoid repeated visits.

## 6. Binary Search Tree (BST) Checker

A **Binary Search Tree** is a binary tree where every node follows two rules:

- Values in the left subtree must be smaller than the current node.
- Values in the right subtree must be greater than the current node.

The `is-bst` and `bst-check` functions use recursion and minimum/maximum value limits to determine whether a tree satisfies these rules.

Two test cases are included:

- **Valid BST:** Returns `True` because all nodes follow the BST ordering rules.
- **Invalid BST:** Returns `False` because the value 6 appears in the left subtree of 5, violating the BST property.

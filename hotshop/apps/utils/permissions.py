# -*- coding: utf-8 -*-

from rest_framework import permissions

# 我们希望所有的代码段都可以被任何人看到，但也要确保只有创建代码段的用户才能更新或删除它。
# 为此，我们将需要创建一个自定义权限。

class IsOwnerOrReadOnly(permissions.BasePermission):
    """
    Object-level permission to only allow owners of an object to edit it.
    Assumes the model instance has an `owner` attribute.
    """

    def has_object_permission(self, request, view, obj):
        """针对数据库条目的权限检查，返回 True 表示允许"""
        # 允许访问只读方法
        if request.method in permissions.SAFE_METHODS:
            return True

        # 非安全方法需要检查用户是否是 owner
        return obj.user == request.user
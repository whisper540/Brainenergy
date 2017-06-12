#!/usr/bin/env python
# -*- coding:utf-8 -*-
# Author:Dkal

class MsgException(Exception):
    def __init__(self,msg):
        self.message = msg

    def __str__(self):
        return self.message
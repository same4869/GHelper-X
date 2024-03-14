/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef FOUNDATION_ACE_NAPI_INTERFACES_KITS_NAPI_NATIVE_API_H
#define FOUNDATION_ACE_NAPI_INTERFACES_KITS_NAPI_NATIVE_API_H

#ifndef NAPI_VERSION
#define NAPI_VERSION 8
#endif

#ifndef NAPI_EXPERIMENTAL
#define NAPI_EXPERIMENTAL
#endif

#include "common.h"
#include "node_api.h"

#ifdef NAPI_TEST
#ifdef _WIN32
#define NAPI_INNER_EXTERN __declspec(dllexport)
#else
#define NAPI_INNER_EXTERN __attribute__((visibility("default")))
#endif
#else
#ifdef _WIN32
#define NAPI_INNER_EXTERN __declspec(deprecated)
#else
#define NAPI_INNER_EXTERN __attribute__((__deprecated__))
#endif
#endif

NAPI_INNER_EXTERN napi_status napi_fatal_exception(napi_env env, napi_value err);


NAPI_EXTERN napi_status napi_create_string_utf16(napi_env env,
                                                 const char16_t* str,
                                                 size_t length,
                                                 napi_value* result);

NAPI_EXTERN napi_status napi_get_value_string_utf16(napi_env env,
                                                    napi_value value,
                                                    char16_t* buf,
                                                    size_t bufsize,
                                                    size_t* result);

NAPI_EXTERN napi_status napi_type_tag_object(napi_env env,
                                             napi_value value,
                                             const napi_type_tag* type_tag);

NAPI_EXTERN napi_status napi_check_object_type_tag(napi_env env,
                                                   napi_value value,
                                                   const napi_type_tag* type_tag,
                                                   bool* result);

NAPI_INNER_EXTERN napi_status napi_add_finalizer(napi_env env,
                                                 napi_value js_object,
                                                 void* native_object,
                                                 napi_finalize finalize_cb,
                                                 void* finalize_hint,
                                                 napi_ref* result);

NAPI_INNER_EXTERN napi_status napi_adjust_external_memory(napi_env env,
                                                          int64_t change_in_bytes,
                                                          int64_t* adjusted_value);

#ifdef __cplusplus
extern "C" {
#endif

typedef void* (*napi_native_binding_detach_callback)(napi_env env, void* native_object, void* hint);
typedef napi_value (*napi_native_binding_attach_callback)(napi_env env, void* native_object, void* hint);

NAPI_EXTERN napi_status napi_run_script_path(napi_env env, const char* path, napi_value* result);
NAPI_EXTERN napi_status napi_queue_async_work_with_qos(napi_env env, napi_async_work work, napi_qos_t qos);
NAPI_EXTERN napi_status napi_load_module(napi_env env, const char* path, napi_value* result);
NAPI_EXTERN napi_status napi_get_instance_data(napi_env env, void** data);
NAPI_EXTERN napi_status napi_set_instance_data(napi_env env,
                                               void* data,
                                               napi_finalize finalize_cb,
                                               void* finalize_hint);
NAPI_EXTERN napi_status napi_remove_env_cleanup_hook(napi_env env, void (*fun)(void* arg), void* arg);
NAPI_EXTERN napi_status napi_add_env_cleanup_hook(napi_env env, void (*fun)(void* arg), void* arg);
NAPI_EXTERN napi_status napi_remove_async_cleanup_hook(napi_async_cleanup_hook_handle remove_handle);
NAPI_EXTERN napi_status napi_add_async_cleanup_hook(napi_env env,
                                                    napi_async_cleanup_hook hook,
                                                    void* arg,
                                                    napi_async_cleanup_hook_handle* remove_handle);
NAPI_EXTERN napi_status napi_async_destroy(napi_env env,
                                           napi_async_context async_context);
NAPI_EXTERN napi_status napi_async_init(napi_env env,
                                        napi_value async_resource,
                                        napi_value async_resource_name,
                                        napi_async_context* result);
NAPI_EXTERN napi_status napi_close_callback_scope(napi_env env, napi_callback_scope scope);
NAPI_EXTERN napi_status napi_open_callback_scope(napi_env env,
                                                 napi_value resource_object,
                                                 napi_async_context context,
                                                 napi_callback_scope* result);
NAPI_EXTERN napi_status node_api_get_module_file_name(napi_env env, const char** result);
NAPI_EXTERN napi_status napi_create_object_with_properties(napi_env env,
                                                           napi_value* result,
                                                           size_t property_count,
                                                           const napi_property_descriptor* properties);
NAPI_EXTERN napi_status napi_create_object_with_named_properties(napi_env env,
                                                                 napi_value* result,
                                                                 size_t property_count,
                                                                 const char** keys,
                                                                 const napi_value* values);
NAPI_EXTERN napi_status napi_coerce_to_native_binding_object(napi_env env,
                                                             napi_value js_object,
                                                             napi_native_binding_detach_callback detach_cb,
                                                             napi_native_binding_attach_callback attach_cb,
                                                             void* native_object,
                                                             void* hint);

#ifdef __cplusplus
}
#endif
#endif /* FOUNDATION_ACE_NAPI_INTERFACES_KITS_NAPI_NATIVE_API_H */

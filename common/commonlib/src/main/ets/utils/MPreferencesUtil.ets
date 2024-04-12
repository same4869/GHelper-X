import data_preferences from '@ohos.data.preferences'
import { ValueType } from '@kit.ArkData'

const defaultPreferenceName = "MPreferencesUtil"
/*
 * @ClassName
 * @Author xwang
 * @Description 同步的简单SP工具类
 * @Date 2024/4/12 13:25
 **/

export class MPreferencesUtil {
  private static preferences?: data_preferences.Preferences
  static readonly context = getContext();

  private constructor() {
  }

  static getPreferences(preferenceName: string = defaultPreferenceName) {
    if (MPreferencesUtil.preferences == null) {
      MPreferencesUtil.preferences = data_preferences.getPreferencesSync(MPreferencesUtil.context, {
        name: preferenceName
      })
    }
    return MPreferencesUtil.preferences
  }

  static setValue<T>(key: string, defaultValue: T, preferenceName: string = defaultPreferenceName) {
    let preferences = MPreferencesUtil.getPreferences(preferenceName)
    preferences.put(key, JSON.stringify(defaultValue))
    preferences.flush()
  }

  static getValue<T>(key: string, defaultValue: ValueType, preferenceName: string = defaultPreferenceName): T {
    let preferences = MPreferencesUtil.getPreferences(preferenceName)
    return preferences.getSync(key, defaultValue) as T
  }

  static getBoolean(key: string, defaultValue: boolean): boolean {
    return MPreferencesUtil.getSync(key, defaultValue) as boolean
  }

  static getNumber(key: string, defaultValue: number): number {
    return MPreferencesUtil.getSync(key, defaultValue) as number
  }

  static getString(key: string, defaultValue: string): string {
    return MPreferencesUtil.getSync(key, defaultValue) as string
  }

  static getSync(key: string, defaultValue: data_preferences.ValueType, preferenceName: string = defaultPreferenceName): data_preferences.ValueType {
    let preferences = MPreferencesUtil.getPreferences(preferenceName)
    return preferences.getSync(key, defaultValue)
  }

  static putSync(key: string, value: data_preferences.ValueType, preferenceName: string = defaultPreferenceName) {
    let preferences = MPreferencesUtil.getPreferences(preferenceName)
    preferences.putSync(key, value)
    preferences.flush()
  }
}